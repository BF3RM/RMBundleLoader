return {
	terrainAssetName = 'Levels/XP1_003/XPACK1_003_Terrain',
	superBundles = {
		'Levels/Coop_010/Coop_010',
		'Levels/MP_013/MP_013',
		'Levels/Coop_003/Coop_003'
	},
	bundles = {
		[ResourceCompartment.ResourceCompartment_Game] = {
			'Levels/Coop_010/Coop_010',
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
			'levels/coop_003/ab00_art_sewer_parent'
		},
		[4] = {
			'Levels/MP_013/ConquestLarge',
		}
	},
	uiBundles = {
	},
	blueprintGuidsToBlock = {

	},
	exceptionGameModeList = {

	}
}
