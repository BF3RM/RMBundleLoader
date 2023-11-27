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
            terrainAssetName = 'Levels/XP3_Desert/Terrain/Terrain_8k',
            superBundles = {
                'levels/MP_017/MP_017',
            },
            bundles = {
                'levels/MP_017/MP_017',
            },
            dynamicBundles = {
                'Levels/MP_017/CQL'
            },
            dynamicRegistries = {
                -- 'MP_017_CoqL_Registry'
                DC(Guid('74CB44C4-DD2E-4CB2-9914-C2579E68567B'), Guid('2F574B5B-D74B-62E8-43BF-18D8EB32939E'))
            }
        }
    }
}
