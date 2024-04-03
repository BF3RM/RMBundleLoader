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
                'Levels/COOP_009/AB00_Parent'
            },
            bundles = {
                'levels/MP_017/MP_017',
                'Levels/COOP_009/AB00_Parent'
            },
            dynamicBundles = {
                'Levels/MP_017/CQL',
                'Levels/COOP_009/AB00_Parent'
            },
            dynamicRegistries = {
                -- 'MP_017_CoqL_Registry'
                DC(Guid('74CB44C4-DD2E-4CB2-9914-C2579E68567B'), Guid('2F574B5B-D74B-62E8-43BF-18D8EB32939E')),
                --'coop9'
				DC(Guid('C4D7B947-D5B8-4B77-823A-98A385CE8C44'), Guid('8B3632CD-5291-62F2-35A5-2F2A866C6E7E'))
            }
        }
    }
}
