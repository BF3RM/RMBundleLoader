return {
	terrainAssetName = 'Levels/XP1_002/Terrain_2/GulfTerrain_03', --XPACK1_001_Terrain.txt/json
	superBundles = {
		'Xp5Chunks',
		'Levels/XP5_001/XP5_001',
	},
	bundles = {
		[ResourceCompartment.ResourceCompartment_Game] = {
			'Levels/XP5_001/XP5_001',
			'Levels/XP5_001/CQS',
			'Levels/XP5_001/Air_Superiority',
		},
	},
	registries = {
		[ResourceCompartment.ResourceCompartment_Game] = {
			'Levels/XP5_001/CQS'
		}
	},
	uiBundles = {
	},
	blueprintGuidsToBlock = {

	},
	exceptionGameModeList = {

	}
}
