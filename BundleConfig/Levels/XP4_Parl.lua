return {
	terrainAssetName = 'Levels/XP4_Parliament/Terrain_Parliament/Terrain_Parliament',
	superBundles = {
		'Levels/Coop_010/Coop_010',
		'Levels/FrontEnd/FrontEnd',
	},
	bundles = {
		[ResourceCompartment.ResourceCompartment_Game] = {
			'Levels/Coop_010/Coop_010',
			'Levels/FrontEnd/FrontEnd', --For mp characters, effects and all weapons
		}
	},
	registries = {
		[4] = {
			'Levels/FrontEnd/FrontEnd'
		}
	},
	uiBundles = {
	},
	blueprintGuidsToBlock = {
	},
	exceptionGameModeList = {
	}
}
