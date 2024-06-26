return {
	terrainAssetName = 'levels/XP5_004/XP5_004_Terrain/XP5_004_Terrain',
	superBundles = {
		'Xp3Chunks',
		'Levels/XP3_Alborz/XP3_Alborz',
		'Levels/MP_003/MP_003',
		'Levels/Coop_003/Coop_003',
	},
	bundles = {
		[ResourceCompartment.ResourceCompartment_Game] = {
			'Levels/XP3_Alborz/XP3_Alborz',
			'Levels/MP_003/MP_003', -- For vodnik
			'Levels/Coop_003/Coop_003',
			'levels/coop_003/ab00_art_sewer_parent'
		},
		[4] = {
			'Levels/MP_003/ConquestLarge'
		}
	},
	registries = {
		[ResourceCompartment.ResourceCompartment_Game] = {
			'levels/coop_003/ab00_art_sewer_parent',
		},
		[4] = {
			'Levels/MP_003/ConquestLarge'
		}
	},
	uiBundles = {
	},
	blueprintGuidsToBlock = {
		-- Architecture/IND_ServiceBuilding_01/IND_ServiceBuilding_01_Destruction
		["D082A96E-756E-781B-7BD6-6031A52945A6"] = true,
		-- Architecture/StoreRoom_01/StoreRoom_01_Destruction/
		["A29933D7-01C5-4934-0033-D639EEA3180D"] = true,
		-- Architecture/ME_House01/ME_House01_Garage_Destruction
		["4FD89229-7326-6148-92C3-AA6750C1BC2C"] = true,
		-- Architecture/ME_House01/ME_House01_Medium_Destruction
		["AFE21578-98EC-11E0-AF4E-CC0B1F0C93C6"] = true
	},
	exceptionGameModeList = {
	}
}
