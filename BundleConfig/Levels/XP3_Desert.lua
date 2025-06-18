return {
	terrainAssetName = 'Levels/XP3_Desert/Terrain/Terrain_8k',
	superBundles = {
		'levels/MP_017/MP_017',
		'Levels/Coop_003/Coop_003',
	},
	bundles = {
		[ResourceCompartment.ResourceCompartment_Game] = {
			'levels/MP_017/MP_017',
			'Levels/Coop_003/Coop_003',
			'levels/coop_003/ab00_art_sewer_parent'
		},
		[4] = {
			'Levels/MP_017/CQL',
			'levels/xp3_desert/rushlarge0'
		}
	},
	registries = {
		[ResourceCompartment.ResourceCompartment_Game] = {
			'levels/coop_003/ab00_art_sewer_parent'
		},
		[4] = {
			'Levels/MP_017/CQL',
			'levels/xp3_desert/rushlarge0'
		}
	},
	uiBundles = {
	},
	blueprintGuidsToBlock = {
	},
	exceptionGameModeList = {
	}
}
