return {
	gameModeConfig = {
		bundles = {
			[ResourceCompartment.ResourceCompartment_Game] = {
				"Levels/COOP_009/AB00_Parent"
			}
		},
		superBundles = {
			"Levels/COOP_009/AB00_Parent"
		},
		registries = {
			[ResourceCompartment.ResourceCompartment_Game] = {
				--'coop9'
				DC(Guid('C4D7B947-D5B8-4B77-823A-98A385CE8C44'), Guid('8B3632CD-5291-62F2-35A5-2F2A866C6E7E'))
			}
		},
		uiBundles = {
			[UiBundleTypes.Playing] = {
			}
		}
	}
}
