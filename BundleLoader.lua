--[[
Copyright (c) [2023] [Flash_Hit a/k/a Bree_Arnold]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
--]]

if Class then
	---@class BundleLoader:Class
	---@overload fun():BundleLoader
	---@diagnostic disable-next-line: assign-type-mismatch
	BundleLoader = Class("BundleLoader")
else
	BundleLoader = class("BundleLoader")

	function BundleLoader:debug(message, ...)
		message = string.format("[BundleLoader] DEBUG: " .. message, ...)
	end

	function BundleLoader:error(message, ...)
		message = string.format("[BundleLoader] ERROR: " .. message, ...)
	end

	function BundleLoader:warn(message, ...)
		message = string.format("[BundleLoader] WARNING: " .. message, ...)
	end
end

---@enum UiBundleTypes
UiBundleTypes = {
	Unknown = 0,
	Loading = 1,
	Playing = 2,
	PreEndOfRound = 3,
	EndOfRound = 4
}

-- Helper: build a lowercase key set from a config's superBundles list
-- Returns { [lowercaseKey] = originalCasing }
local function _BuildSuperBundleSet(p_Config)
	local s_Set = {}
	if p_Config and p_Config.superBundles then
		for _, l_SB in ipairs(p_Config.superBundles) do
			s_Set[l_SB:lower()] = l_SB
		end
	end
	return s_Set
end

-- Helper: merge multiple sets into one
local function _MergeSets(...)
	local s_Result = {}
	for _, l_Set in ipairs({ ... }) do
		for l_Key, l_Val in pairs(l_Set) do
			s_Result[l_Key] = l_Val
		end
	end
	return s_Result
end

function BundleLoader:__init()
	self.currentLevelConfig         = {}
	self.currentGameModeConfig      = {}
	self.currentLevelGameModeConfig = {}
	self.commonConfig               = BundleLoader.GetCommonBundleConfig()
	self.LevelName                  = nil
	self.commonSuperBundlesMounted  = false

	-- Tracks all currently mounted SuperBundles: { [lowercaseKey] = originalCasing }
	-- This is the single source of truth for what's mounted at any point in time
	self.mountedSuperBundles        = {}

	Hooks:Install("Terrain:Load", 999, self, self.OnTerrainLoad)
	Hooks:Install("VisualTerrain:Load", 999, self, self.OnTerrainLoad)
	Events:Subscribe('Level:RegisterEntityResources', self, self.OnLevelRegisterEntityResources)

	return self
end

function BundleLoader:OnLevelDestroy()
	self:debug("Level destroyed, deferring SuperBundle cleanup...")

	-- IMPORTANT: Do NOT unmount or pre-mount anything here.
	-- SharedUtils:GetLevelName() still returns the CURRENT map's name at this point,
	-- so we cannot reliably determine what the next map needs.
	-- All SuperBundle mount/unmount decisions are deferred to OnLoadBundles
	-- where UpdateConfig() has already been called and the new level name is confirmed.

	self.currentLevelConfig         = {}
	self.currentGameModeConfig      = {}
	self.currentLevelGameModeConfig = {}
	self.LevelName                  = nil

	collectgarbage("collect")
	collectgarbage("collect")

	self:debug("Cleanup deferred to next OnLoadBundles call.")
end

function BundleLoader:UpdateConfig()
	self.currentLevelConfig         = BundleLoader.GetLevelBundleConfig()
	self.currentGameModeConfig      = BundleLoader.GetGameModeBundleConfig()
	self.currentLevelGameModeConfig = BundleLoader.GetLevelAndGameModeBundleConfig()

	local s_LevelName               = SharedUtils:GetLevelName()
	self.LevelName                  = s_LevelName

	if s_LevelName and self.currentGameModeConfig.exceptionLevelList then
		for _, l_LevelName in ipairs(self.currentGameModeConfig.exceptionLevelList) do
			if s_LevelName:match(l_LevelName) then
				self.currentGameModeConfig = {}
				break
			end
		end
	end

	local s_GameMode = SharedUtils:GetCurrentGameMode()
	if s_GameMode and self.currentLevelConfig.exceptionGameModeList then
		for _, l_GameMode in ipairs(self.currentLevelConfig.exceptionGameModeList) do
			if s_GameMode:match(l_GameMode) then
				self.currentLevelConfig = {}
				break
			end
		end
	end
end

function BundleLoader:OnEntityCreateFromBlueprint(p_HookCtx, p_Blueprint, p_Transform, p_Variation, p_ParentRepresentative)
	if self.currentLevelConfig.blueprintGuidsToBlock and self.currentLevelConfig.blueprintGuidsToBlock[tostring(p_Blueprint.instanceGuid)] then
		p_HookCtx:Return()
	end
end

function BundleLoader:GetUIBundleType(p_Bundles)
	for _, l_Bundle in ipairs(p_Bundles) do
		if l_Bundle:match("UiLoading") then
			return UiBundleTypes.Loading
		elseif l_Bundle:match("UiPlaying") then
			return UiBundleTypes.Playing
		elseif l_Bundle:match("UiPreEndOfRound") then
			return UiBundleTypes.PreEndOfRound
		elseif l_Bundle:match("UiEndOfRound") then
			return UiBundleTypes.EndOfRound
		end
	end

	return UiBundleTypes.Unknown
end

local function _ContainsBundle(p_Bundles, p_Bundle)
	p_Bundle = p_Bundle:lower()

	for _, l_Bundle in ipairs(p_Bundles) do
		if l_Bundle:lower() == p_Bundle then
			return true
		end
	end

	return false
end

function BundleLoader:AddBundles(p_Bundles, p_BundlesToAdd)
	for l_Index, l_Bundle in ipairs(p_BundlesToAdd) do
		if _ContainsBundle(p_Bundles, l_Bundle) then
			self:debug("Ignoring bundle '%s'. It is already in the list.", l_Bundle)
		else
			self:debug("%s: %s", l_Index, l_Bundle)
			table.insert(p_Bundles, l_Bundle)
		end
		::continue::
	end
end

function BundleLoader:GetBundles(p_Bundles, p_Compartment)
	local s_Bundles = {}
	self:debug("Loading compartment %s", p_Compartment)

	if self.commonConfig.bundles and self.commonConfig.bundles[p_Compartment] then
		self:debug("Common Config Bundles:")
		self:AddBundles(s_Bundles, self.commonConfig.bundles[p_Compartment])
	end

	if self.currentLevelConfig.bundles and self.currentLevelConfig.bundles[p_Compartment] then
		self:debug("Current Level Config Bundles:")
		self:AddBundles(s_Bundles, self.currentLevelConfig.bundles[p_Compartment])
	end

	if self.currentLevelGameModeConfig.bundles and self.currentLevelGameModeConfig.bundles[p_Compartment] then
		self:debug("Current Level + GameMode Config Bundles:")
		self:AddBundles(s_Bundles, self.currentLevelGameModeConfig.bundles[p_Compartment])
	end

	if self.currentGameModeConfig.bundles and self.currentGameModeConfig.bundles[p_Compartment] then
		self:debug("Current GameMode Config Bundles:")
		self:AddBundles(s_Bundles, self.currentGameModeConfig.bundles[p_Compartment])
	end

	-- Handle special client compartment
	if p_Compartment == ResourceCompartment.ResourceCompartment_Frontend then
		local s_Type = self:GetUIBundleType(p_Bundles)

		if self.commonConfig.uiBundles and self.commonConfig.uiBundles[s_Type] then
			self:debug("Common Config UI Bundles:")
			self:AddBundles(s_Bundles, self.commonConfig.uiBundles[s_Type])
		end

		if self.currentLevelConfig.uiBundles and self.currentLevelConfig.uiBundles[s_Type] then
			self:debug("Current Level Config UI Bundles:")
			self:AddBundles(s_Bundles, self.currentLevelConfig.uiBundles[s_Type])
		end

		if self.currentLevelGameModeConfig.uiBundles and self.currentLevelGameModeConfig.uiBundles[s_Type] then
			self:debug("Current Level + GameMode Config UI Bundles:")
			self:AddBundles(s_Bundles, self.currentLevelGameModeConfig.uiBundles[s_Type])
		end

		if self.currentGameModeConfig.uiBundles and self.currentGameModeConfig.uiBundles[s_Type] then
			self:debug("Current GameMode Config UI Bundles:")
			self:AddBundles(s_Bundles, self.currentGameModeConfig.uiBundles[s_Type])
		end
	end

	self:debug("Game Bundles:")
	self:AddBundles(s_Bundles, p_Bundles)

	return s_Bundles
end

function BundleLoader:OnMountSuperBundles()
	-- Mount common SuperBundles only once, skip if already tracked as mounted
	if not self.commonSuperBundlesMounted and self.commonConfig.superBundles then
		for l_Index, l_SuperBundle in ipairs(self.commonConfig.superBundles) do
			local l_Key = l_SuperBundle:lower()
			if not self.mountedSuperBundles[l_Key] then
				self:debug("Mounting Common SuperBundle %s: %s.", l_Index, l_SuperBundle)
				ResourceManager:MountSuperBundle(l_SuperBundle)
				self.mountedSuperBundles[l_Key] = l_SuperBundle
			end
			::continue::
		end
		self.commonSuperBundlesMounted = true
		self:debug("Common SuperBundles mounted.")
	end

	local function _MountConfig(p_Config, p_Label)
		if not p_Config or not p_Config.superBundles then return end
		for l_Index, l_SuperBundle in ipairs(p_Config.superBundles) do
			local l_Key = l_SuperBundle:lower()
			if not self.mountedSuperBundles[l_Key] then
				self:debug("Mounting %s SuperBundle %s: %s.", p_Label, l_Index, l_SuperBundle)
				ResourceManager:MountSuperBundle(l_SuperBundle)
				self.mountedSuperBundles[l_Key] = l_SuperBundle
			else
				self:debug("Skipping already-mounted %s SuperBundle: %s.", p_Label, l_SuperBundle)
			end
		end
	end

	_MountConfig(self.currentLevelConfig, "Level")
	_MountConfig(self.currentLevelGameModeConfig, "Level+GameMode")
	_MountConfig(self.currentGameModeConfig, "GameMode")

	self:debug("Mounted all SuperBundles.")
end

function BundleLoader:AddRegistries(p_Registries)
	for l_Compartment, l_Names in pairs(p_Registries) do
		for _, l_Name in ipairs(l_Names) do
			self:debug("Adding RegistryContainer from '%s' to compartment %s.", l_Name, l_Compartment)
			local s_SubWorldData = ResourceManager:SearchForDataContainer(l_Name)

			if not s_SubWorldData then
				self:error("Failed to find the SubWorldData for '%s'.", l_Name)
				return
			end

			s_SubWorldData = SubWorldData(s_SubWorldData)

			if not s_SubWorldData.registryContainer then
				self:error("Failed to find the RegistryContainer to add for '%s'.", l_Name)
				return
			end

			ResourceManager:AddRegistry(s_SubWorldData.registryContainer, l_Compartment)
			::continue::
		end
	end
end

---VEXT Shared Level:RegisterEntityResources Event
---@param p_LevelData DataContainer|LevelData @needs to be upcasted to LevelData
function BundleLoader:OnLevelRegisterEntityResources(p_LevelData)
	if self.commonConfig.registries then
		self:AddRegistries(self.commonConfig.registries)
	end

	if self.currentLevelConfig.registries then
		self:AddRegistries(self.currentLevelConfig.registries)
	end

	if self.currentLevelGameModeConfig.registries then
		self:AddRegistries(self.currentLevelGameModeConfig.registries)
	end

	if self.currentGameModeConfig.registries then
		self:AddRegistries(self.currentGameModeConfig.registries)
	end
end

---VEXT Shared ResourceManager:LoadBundles Hook
---@param p_HookCtx HookContext
---@param p_Bundles string[]
---@param p_Compartment ResourceCompartment|integer
function BundleLoader:OnLoadBundles(p_HookCtx, p_Bundles, p_Compartment)
	if p_Compartment == ResourceCompartment.ResourceCompartment_Game then
		-- UpdateConfig reads the new level name - this is the first safe point
		-- where SharedUtils:GetLevelName() returns the incoming map
		self:UpdateConfig()

		-- Build the set of SuperBundles the new map actually needs
		local s_NeededNow = _MergeSets(
			_BuildSuperBundleSet(self.commonConfig),
			_BuildSuperBundleSet(self.currentLevelConfig),
			_BuildSuperBundleSet(self.currentGameModeConfig),
			_BuildSuperBundleSet(self.currentLevelGameModeConfig)
		)

		-- Step 1: Mount everything the new map needs first
		-- This ensures no gap where a needed SuperBundle isn't available
		self:OnMountSuperBundles()

		-- Step 2: Now safely unmount anything the new map does NOT need
		-- We do this after mounting so we never have a missing SuperBundle window
		for l_Key, l_Original in pairs(self.mountedSuperBundles) do
			if not s_NeededNow[l_Key] then
				self:debug("Unmounting unneeded SuperBundle: %s", l_Original)
				ResourceManager:UnmountSuperBundle(l_Original)
				self.mountedSuperBundles[l_Key] = nil
			end
		end
	end

	p_HookCtx:Pass(self:GetBundles(p_Bundles, p_Compartment), p_Compartment)
end

---VEXT Shared VisualTerrain:Load Hook
---VEXT Shared Terrain:Load Hook
---@param p_HookCtx HookContext
---@param p_TerrainName string
function BundleLoader:OnTerrainLoad(p_HookCtx, p_TerrainName)
	if self.currentLevelGameModeConfig.terrainAssetName then
		if not string.find(p_TerrainName:lower(), self.currentLevelGameModeConfig.terrainAssetName:lower()) then
			p_HookCtx:Return()
		end
		return
	end

	if self.currentLevelConfig.terrainAssetName then
		if not string.find(p_TerrainName:lower(), self.currentLevelConfig.terrainAssetName:lower()) then
			p_HookCtx:Return()
		end
		return
	end

	self:warn("No terrain asset name specified. This means every terrain will be loaded.")
	self:warn("Loading terrain '%s'", p_TerrainName)
end

-- NOTE: THIS BELOW EXPECTS A SPECIFIC STRUCTURE

-- Include modifications that should get loaded every time.
function BundleLoader.GetCommonBundleConfig()
	local s_Success, s_BundleConfig = pcall(require, "__shared/BundleLoader/BundleConfig/Common")
	return s_Success and s_BundleConfig or {}
end

-- Include level specific modifications. Only get loaded when the level does.
function BundleLoader.GetLevelBundleConfig()
	local s_LevelName = SharedUtils:GetLevelName():gsub(".*/", "")
	local s_Success, s_BundleConfig = pcall(require, string.format("__shared/BundleLoader/BundleConfig/Levels/%s", s_LevelName))
	return s_Success and s_BundleConfig or {}
end

-- Include gamemode specific modifications. Only get loaded when the gamemode does.
function BundleLoader.GetGameModeBundleConfig()
	local s_Success, s_BundleConfig = pcall(require, string.format("__shared/BundleLoader/BundleConfig/GameModes/%s", SharedUtils:GetCurrentGameMode()))
	return s_Success and s_BundleConfig or {}
end

-- Include level & gamemode specific modifications. Only get loaded when the level & gamemode does.
function BundleLoader.GetLevelAndGameModeBundleConfig()
	local s_LevelName = SharedUtils:GetLevelName():gsub(".*/", "")
	local s_Success, s_BundleConfig = pcall(require, string.format("__shared/BundleLoader/BundleConfig/Levels/%s/%s", s_LevelName, SharedUtils:GetCurrentGameMode()))
	return s_Success and s_BundleConfig or {}
end

BundleLoader = BundleLoader()

return BundleLoader
