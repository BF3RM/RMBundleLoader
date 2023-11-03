return {
	{
		gamemodes = {
			"AdvanceAndSecureStd",
			"AdvanceAndSecureAlt",
			"ConquestLarge0",
			"SkirmishStd",
			"TrainingStd",
		},
		config = {
			terrainAssetName = 'Levels/MP_007/Terrain/MP_007', --terrain.json.txt
			superBundles = {
				'Levels/XP5_001/XP5_001',
			},
			bundles = {
				'Levels/XP5_001/XP5_001',
			},
			blueprintGuidsToBlock = {
				-- Architecture/IND_ServiceBuilding_01/IND_ServiceBuilding_01_Destruction,
				["D082A96E-756E-781B-7BD6-6031A52945A6"] = true,
				-- Architecture/StoreRoom_01/StoreRoom_01_Destruction, 
				["A29933D7-01C5-4934-0033-D639EEA3180D"] = true,
				-- Architecture/IND_ServiceBuilding_02/IND_ServiceBuilding_02_Destruction
				["9FEEB38F-8FDC-B57B-7CD7-EB4DB9FBE7C4"] = true,
				
				-- Architecture/ME_House01/ME_House01_Garage_Destruction
				["4FD89229-7326-6148-92C3-AA6750C1BC2C"] = true,
				-- Architecture/ME_House01/ME_House01_Medium_Destruction
				["AD02627E-9DC7-2FD1-2927-64EC3FE596CF"] = true,
				-- Architecture/ME_House01/ME_House01_Large_Destruction,
				["BEB7019C-5CB2-3F7D-E558-30EAE4D1EA95"] = true
			}
		}
	}
}