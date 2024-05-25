return {
	terrainAssetName = 'Levels/XP4_Parliament/Terrain_Parliament/Terrain_Parliament',
	superBundles = {
		'Levels/Coop_010/Coop_010',
		'Levels/MP_013/MP_013',
	},
	bundles = {
		[ResourceCompartment.ResourceCompartment_Game] = {
			'Levels/Coop_010/Coop_010',
			'Levels/MP_013/MP_013' -- For vodnik
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
