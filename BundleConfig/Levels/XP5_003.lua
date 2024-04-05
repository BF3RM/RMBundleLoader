return {
	terrainAssetName = 'Levels/XP5_003/XP5_003_Terrain/XP5_003_Terrain',
	superBundles = {
		'Levels/MP_013/MP_013'
	},
	bundles = {
		[ResourceCompartment.ResourceCompartment_Game] = {
			'Levels/MP_013/MP_013'
		},
		[4] = {
			'Levels/MP_013/ConquestLarge'
		}
	},
	registries = {
		[4] = {
			'Levels/MP_013/ConquestLarge'
		}
	},
	uiBundles = {
	},
	blueprintGuidsToBlock = {
		-- Architecture/ME_House01/ME_House01_Garage_Destruction
		["4FD89229-7326-6148-92C3-AA6750C1BC2C"] = true,
		-- Architecture/StoreRoom_01/StoreRoom_01_Destruction/
		["A29933D7-01C5-4934-0033-D639EEA3180D"] = true
	},
	exceptionGameModeList = {
	}
}
