return {
	superBundles = {
		'SpChunks',
		'Levels/SP_Tank/SP_Tank',
		'Levels/SP_Bank/SP_Bank',
		'Levels/Coop_006/Coop_006',
		'Levels/Coop_009/Coop_009',
		'Levels/MP_001/MP_001'
	},
	bundles = {
		[ResourceCompartment.ResourceCompartment_Game] = {
			"Levels/SP_Tank/SP_Tank",
			"Levels/SP_Tank/DesertFort",
			"Levels/SP_Bank/SP_Bank",
			"Levels/SP_Bank/Ride_SUB",
			'Levels/Coop_006/Coop_006',
			'Levels/Coop_009/Coop_009',
			'Levels/COOP_006/AB03_Parent'
		},
		[4] = {
			'Levels/MP_001/Conquest_Large'
		}
	},
	registries = {
		[ResourceCompartment.ResourceCompartment_Game] = {
			"Levels/SP_Tank/DesertFort",
			"Levels/SP_Bank/Ride_SUB",
			"Levels/Coop_006/Coop_006",
			"Levels/Coop_009/Coop_009"
		},
		[4] = {
			'Levels/MP_001/Conquest_Large',
			'Levels/COOP_006/AB03_Parent'
		}
	}
}
