return {
	terrainAssetName = 'levels/XP5_001/terrain/terrainexample',
	superBundles = {
		'Levels/MP_013/MP_013',
		'Levels/Coop_003/Coop_003',
	},
	bundles = {
		[ResourceCompartment.ResourceCompartment_Game] = {
			'Levels/Coop_009/AB00_Art_Parent',
			'Levels/Coop_009/AB00_Art_Interior_Parent',
			'Levels/MP_013/MP_013', -- For vodnik
			'Levels/Coop_003/Coop_003',
			'levels/coop_003/ab00_art_sewer_parent'
		},
		[4] = {
			'Levels/MP_013/ConquestLarge'
		}
	},
	registries = {
		[ResourceCompartment.ResourceCompartment_Game] = {
			'levels/coop_003/ab00_art_sewer_parent',
		},
		[4] = {
			'Levels/MP_013/ConquestLarge'
		}
	},
	uiBundles = {
	},
	blueprintGuidsToBlock = {
		-- Architecture/IND_ServiceBuilding_01/IND_ServiceBuilding_01_Destruction
		["D082A96E-756E-781B-7BD6-6031A52945A6"] = true,
		-- Architecture/StoreRoom_01/StoreRoom_01_Destruction/
		["A29933D7-01C5-4934-0033-D639EEA3180D"] = true
	},
	exceptionGameModeList = {
	}
}
