return {
	{
		gamemodes = {
			"AdvanceAndSecureStd",
			"AdvanceAndSecureAlt",
			"ConquestLarge0",
			"SkirmishStd",
			"TrainingStd",
			"InsurgencyStd"
		},
		config = {
			terrainAssetName = 'Levels/XP1_002/Terrain_2/GulfTerrain_03',
			superBundles = {
				'Xp5Chunks',
				'Levels/XP5_001/XP5_001',
				'Levels/COOP_009/AB00_Parent'
			},
			bundles = {
				'Levels/XP5_001/XP5_001',
				'Levels/XP5_001/Air_Superiority',
				'Levels/COOP_009/AB00_Parent'
			},
			dynamicBundles = {
					'Levels/COOP_009/AB00_Parent'
			},
			dynamicRegistries = {
				--'coop9'
				DC(Guid('C4D7B947-D5B8-4B77-823A-98A385CE8C44'), Guid('8B3632CD-5291-62F2-35A5-2F2A866C6E7E'))
			}
		}
	}
}
