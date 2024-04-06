return {
	terrainAssetName = 'levels/xp3_legrandval/terrain/legrandval',
	superBundles = {
		'Xp3Chunks',
		'Levels/XP3_Alborz/XP3_Alborz',
		'Levels/MP_013/MP_013'
	},
	bundles = {
		[ResourceCompartment.ResourceCompartment_Game] = {
			'Levels/XP3_Alborz/XP3_Alborz',
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
