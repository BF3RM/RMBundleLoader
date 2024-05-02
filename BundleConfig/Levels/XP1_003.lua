return {
	terrainAssetName = 'Levels/XP1_003/XPACK1_003_Terrain',
	superBundles = {
		'Levels/Coop_010/Coop_010',
		'Levels/MP_013/MP_013',
	},
	bundles = {
		[ResourceCompartment.ResourceCompartment_Game] = {
			'Levels/Coop_010/Coop_010',
			'Levels/MP_013/MP_013', -- For vodnik
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

	},
	exceptionGameModeList = {

	}
}
