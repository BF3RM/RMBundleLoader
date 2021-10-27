-- NOTE: Also includes bundles/superbundles required for vu-spterrains
return {
	terrainAssetName = 'Levels/COOP_006/Terrain/COOP_006_Terrain',
	superBundles = {
		-- Required for vu-spterrains (MP logic, skybox...maybe)
		'mpchunks',
		'ui',
		'levels/mp_013/mp_013',
		-- RM
		'levels/sp_tank/sp_tank',
		'levels/sp_bank/sp_bank',
		'levels/coop_009/coop_009',
	},
	bundles = {
		-- Required for vu-spterrains (MP logic, skybox...maybe)
		'ui/flow/bundle/loadingbundlemp',
		'levels/mp_013/mp_013',
		'levels/mp_013/conquestlarge',
		-- RM
		'levels/sp_tank/sp_tank',
		'levels/sp_tank/desertfort',
		'levels/sp_bank/sp_bank',
		'levels/sp_bank/ride_sub',
		'levels/coop_009/coop_009',
	}
}