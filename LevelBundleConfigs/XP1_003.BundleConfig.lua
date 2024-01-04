return {
	{
		gamemodes = {
			"AdvanceAndSecureStd",
			"AdvanceAndSecureAlt",
			"ConquestAssaultLarge0",
			"SkirmishStd",
			"TrainingStd",
			"InsurgencyStd"
		},
		config = {
            terrainAssetName = 'Levels/XP1_003/XPACK1_003_Terrain', --XPACK1_001_Terrain.txt/json
			superBundles = {
				'Levels/Coop_010/Coop_010',
				'Levels/MP_013/MP_013',
				'Levels/COOP_009/AB00_Parent'
			},
			bundles = {
				'Levels/Coop_010/Coop_010',
				'Levels/MP_013/MP_013', -- For vodnik
				'Levels/COOP_009/AB00_Parent'
			},
			dynamicBundles = {
				'Levels/MP_013/ConquestLarge',
				'Levels/COOP_009/AB00_Parent'
			},
			dynamicRegistries = {
				-- 'MP_013_ConquestLarge_Registry'
				DC(Guid('1CEC6C7E-1629-4631-B326-1A134BC6EF27'), Guid('6196137B-50D6-4607-98AE-900BACF47065'))
			}
        }
	}
}