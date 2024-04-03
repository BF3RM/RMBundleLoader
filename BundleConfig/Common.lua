return {
	superBundles = {
		'SpChunks',
		'Levels/SP_Tank/SP_Tank',
		'Levels/SP_Bank/SP_Bank',
		'Levels/Coop_006/Coop_006',
		'Levels/Coop_009/Coop_009'
	},
	bundles = {
		[ResourceCompartment.ResourceCompartment_Game] = {
			"Levels/SP_Tank/SP_Tank",
			"Levels/SP_Tank/DesertFort",
			"Levels/SP_Bank/SP_Bank",
			"Levels/SP_Bank/Ride_SUB",
			'Levels/Coop_006/Coop_006',
			'Levels/Coop_009/Coop_009'
		}
	},
	registries = {
		[ResourceCompartment.ResourceCompartment_Game] = {
			"Levels/SP_Tank/DesertFort",
			"Levels/SP_Bank/Ride_SUB"
		}
	}
}
