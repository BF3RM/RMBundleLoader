return {
	levelConfig = {
		{
			terrainAssetName = 'Levels/XP1_001/XPACK1_001_Terrain', --XPACK1_001_Terrain.txt/json
			superBundles = {
				'Levels/Coop_010/Coop_010',
				'Levels/MP_013/MP_013',
			},
			bundles = {
				[ResourceCompartment.ResourceCompartment_Game] = {
					'Levels/Coop_010/Coop_010',
					'Levels/MP_013/MP_013', -- For vodnik
				}
			},
			registries = {
				[ResourceCompartment.ResourceCompartment_Game] = {
					--'MP_013_ConquestLarge_Registry'
					DC(Guid('1CEC6C7E-1629-4631-B326-1A134BC6EF27'), Guid('6196137B-50D6-4607-98AE-900BACF47065')),
				}
			},
			uiBundles = {
				[UiBundleTypes.Loading] = {
				}
			}
		}
	}
}
