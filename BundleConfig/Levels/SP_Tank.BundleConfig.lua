return {
	{
		gamemodes = {
			"AdvanceAndSecureStd",
			"AdvanceAndSecureAlt",
			"ConquestAssaultLarge0",
			"SkirmishStd",
			"TrainingStd"
		},
		config = {
			terrainAssetName = 'Levels/SP_Tank/Terrain/SP_Tank_Terrain_02',
			superBundles = {
            'mpchunks',
            'Levels/MP_013/MP_013', -- HMMWV/Vodnik, mapping assets
            'levels/mp_012/mp_012', -- MP logic
			},
			bundles = {
                'Levels/MP_013/MP_013',
                'Levels/MP_013/ConquestLarge',
                'levels/mp_012/mp_012',
                'levels/mp_012/conquest_large',
                'levels/sp_tank/sp_tank',
                'levels/sp_tank/desertfort',
                'levels/sp_tank/backdrop',
                'levels/sp_tank/miclicart',
                'levels/sp_tank/highwayofdeath',
                'levels/sp_tank/highwayofdeath2',
			},
			dynamicBundles = {
				'Levels/MP_013/ConquestLarge'
			},
			dynamicRegistries = {
				-- 'MP_013_ConquestLarge_Registry'
				DC(Guid('1CEC6C7E-1629-4631-B326-1A134BC6EF27'), Guid('6196137B-50D6-4607-98AE-900BACF47065'))
			}
		}
	}
}