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
			terrainAssetName = 'Levels/XP4_Parliament/Terrain_Parliament/Terrain_Parliament',
			superBundles = {
				'Levels/Coop_010/Coop_010',
				'Levels/FrontEnd/FrontEnd',
				'Levels/COOP_009/AB00_Parent'
			},
			bundles = {
				'Levels/Coop_010/Coop_010',
				'Levels/FrontEnd/FrontEnd', --For mp characters, effects and all weapons
				'Levels/COOP_009/AB00_Parent'
			},
			registries = {
				-- 'FrontEnd_Registry'
				DC(Guid('E07FE68C-01C4-4262-B215-A3FFDE21234C'), Guid('FED93F47-9267-86B1-3B04-D9405BD49C36')),
				--'coop9'
				DC(Guid('C4D7B947-D5B8-4B77-823A-98A385CE8C44'), Guid('8B3632CD-5291-62F2-35A5-2F2A866C6E7E'))
			}
		}
	}
}
