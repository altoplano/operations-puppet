# role/cache.pp
# cache::squid and cache::varnish role classes

# Virtual resources for the monitoring server
@monitor_group { "cache_text_pmtpa": description => "text squids pmtpa" }
@monitor_group { "cache_text_eqiad": description => "text squids eqiad" }
@monitor_group { "cache_text_esams": description => "text squids esams" }

@monitor_group { "cache_upload_pmtpa": description => "upload squids pmtpa" }
@monitor_group { "cache_upload_eqiad": description => "upload squids eqiad" }
@monitor_group { "cache_upload_esams": description => "upload squids esams" }

@monitor_group { "cache_parsoid_pmtpa": description => "Parsoid caches pmtpa" }
@monitor_group { "cache_parsoid_eqiad": description => "Parsoid caches eqiad" }

class role::cache {
	class configuration {
		include lvs::configuration

		$active_nodes = {
			'production' => {
				"text" => {
					"pmtpa" => [
						'sq33.wikimedia.org',   # API
						'sq34.wikimedia.org',   # API
						'sq36.wikimedia.org',   # API
						'sq37.wikimedia.org',
						'sq59.wikimedia.org',
						'sq60.wikimedia.org',
						'sq61.wikimedia.org',
						'sq62.wikimedia.org',
						'sq63.wikimedia.org',
						'sq64.wikimedia.org',
						'sq65.wikimedia.org',
						'sq66.wikimedia.org',
						'sq71.wikimedia.org',
						'sq72.wikimedia.org',
						'sq73.wikimedia.org',
						'sq74.wikimedia.org',
						'sq75.wikimedia.org',
						'sq76.wikimedia.org',
						'sq77.wikimedia.org',
						'sq78.wikimedia.org',
					],
					"eqiad" => [
						'cp1001.eqiad.wmnet',	# API
						'cp1002.eqiad.wmnet',	# API
						'cp1003.eqiad.wmnet',	# API
						'cp1004.eqiad.wmnet',	# API
						'cp1005.eqiad.wmnet',	# API
						'cp1006.eqiad.wmnet',
						'cp1007.eqiad.wmnet',
						'cp1008.eqiad.wmnet',
						'cp1009.eqiad.wmnet',
						'cp1010.eqiad.wmnet',
						'cp1011.eqiad.wmnet',
						'cp1012.eqiad.wmnet',
						'cp1013.eqiad.wmnet',
						'cp1014.eqiad.wmnet',
						'cp1015.eqiad.wmnet',
						'cp1016.eqiad.wmnet',
						'cp1017.eqiad.wmnet',
						'cp1018.eqiad.wmnet',
						'cp1019.eqiad.wmnet',
						'cp1020.eqiad.wmnet',
					],
					"eqiad-varnish" => [
						'cp1037.eqiad.wmnet',
						'cp1038.eqiad.wmnet',
						'cp1039.eqiad.wmnet',
						'cp1040.eqiad.wmnet',
					],
					"esams" => [
						"knsq23.knams.wikimedia.org",
						"knsq24.knams.wikimedia.org",
						"knsq25.knams.wikimedia.org",
						"knsq26.knams.wikimedia.org",
						"knsq27.knams.wikimedia.org",
						"knsq28.knams.wikimedia.org",
						"knsq29.knams.wikimedia.org",

						"amssq31.esams.wikimedia.org",
						"amssq32.esams.wikimedia.org",
						"amssq33.esams.wikimedia.org",
						"amssq34.esams.wikimedia.org",
						"amssq35.esams.wikimedia.org",
						"amssq36.esams.wikimedia.org",
						"amssq37.esams.wikimedia.org",
						"amssq38.esams.wikimedia.org",
						"amssq39.esams.wikimedia.org",
						"amssq40.esams.wikimedia.org",
						"amssq41.esams.wikimedia.org",
						"amssq42.esams.wikimedia.org",
						"amssq43.esams.wikimedia.org",
						"amssq44.esams.wikimedia.org",
						"amssq45.esams.wikimedia.org",
						"amssq46.esams.wikimedia.org",
					],
					"esams-varnish" => [
						'amssq47.esams.wikimedia.org',
					]
				},
				"api" => {
					"pmtpa" => [
						'sq33.wikimedia.org',   # API
						'sq34.wikimedia.org',   # API
						'sq36.wikimedia.org',   # API
					],
					"eqiad" => [
						'cp1001.eqiad.wmnet',	# API
						'cp1002.eqiad.wmnet',	# API
						'cp1003.eqiad.wmnet',	# API
						'cp1004.eqiad.wmnet',	# API
						'cp1005.eqiad.wmnet',	# API
					],
					"esams" => [],
				},
				"bits" => {
					"pmtpa" => ["sq67.wikimedia.org", "sq68.wikimedia.org", "sq69.wikimedia.org", "sq70.wikimedia.org"],
					"eqiad" => ["arsenic.wikimedia.org", "niobium.wikimedia.org", "strontium.eqiad.wmnet", "palladium.eqiad.wmnet", ],
					"esams" => ["cp3019.esams.wikimedia.org", "cp3020.esams.wikimedia.org", "cp3021.esams.wikimedia.org", "cp3022.esams.wikimedia.org"],
				},
				"upload" => {
					"pmtpa" => [
						'sq41.wikimedia.org',
						'sq42.wikimedia.org',
						'sq43.wikimedia.org',
						'sq44.wikimedia.org',
						'sq45.wikimedia.org',
						'sq48.wikimedia.org',
						'sq49.wikimedia.org',
						'sq50.wikimedia.org',

						'sq51.wikimedia.org',
						'sq52.wikimedia.org',
						'sq53.wikimedia.org',
						'sq54.wikimedia.org',
						'sq55.wikimedia.org',
						'sq56.wikimedia.org',
						'sq57.wikimedia.org',
						'sq58.wikimedia.org',

						'sq79.wikimedia.org',
						'sq80.wikimedia.org',
						'sq81.wikimedia.org',
						'sq82.wikimedia.org',
						'sq83.wikimedia.org',
						'sq84.wikimedia.org',
						'sq85.wikimedia.org',
						'sq86.wikimedia.org',
					],
					"eqiad" => [
						'cp1021.eqiad.wmnet',
						'cp1022.eqiad.wmnet',
						'cp1023.eqiad.wmnet',
						'cp1024.eqiad.wmnet',
						'cp1025.eqiad.wmnet',
						'cp1026.eqiad.wmnet',
						'cp1027.eqiad.wmnet',
						'cp1028.eqiad.wmnet',
						'cp1029.eqiad.wmnet',
						'cp1030.eqiad.wmnet',
						'cp1031.eqiad.wmnet',
						'cp1032.eqiad.wmnet',
						'cp1033.eqiad.wmnet',
						'cp1034.eqiad.wmnet',
						'cp1035.eqiad.wmnet',
						'cp1036.eqiad.wmnet',
						'dysprosium.eqiad.wmnet',
					],
					"esams" => [
						'cp3003.esams.wikimedia.org',
						'cp3004.esams.wikimedia.org',
						'cp3005.esams.wikimedia.org',
						'cp3006.esams.wikimedia.org',
						'cp3007.esams.wikimedia.org',
						'cp3008.esams.wikimedia.org',
						'cp3009.esams.wikimedia.org',
						'cp3010.esams.wikimedia.org',
					],
				},
				"mobile" => {
					"pmtpa" => [],
					"eqiad" => ["cp1041.eqiad.wmnet", "cp1042.eqiad.wmnet", "cp1043.wikimedia.org", "cp1044.wikimedia.org"],
					"esams" => []
				},
				"parsoid" => {
					"pmtpa" => ["celsus.pmtpa.wmnet", "constable.pmtpa.wmnet"],
					"eqiad" => ["cerium.wikimedia.org", "titanium.wikimedia.org"],
					"esams" => []
				}
			},
			'labs' => {
				'api'    => { 'pmtpa' => '127.0.0.1', },
				'bits'   => { 'pmtpa' => '127.0.0.1', },
				'mobile' => { 'pmtpa' => '127.0.0.1', },
				'text'   => { 'pmtpa' => '127.0.0.1', },
				'upload' => { 'pmtpa' => '127.0.0.1', },
				'parsoid' => { 'pmtpa' => '127.0.0.1', },
			},
		}

		$decommissioned_nodes = {
			"text" => {
				"pmtpa" => [
					'sq16.wikimedia.org',
					'sq17.wikimedia.org',
					'sq18.wikimedia.org',
					'sq19.wikimedia.org',
					'sq20.wikimedia.org',
					'sq21.wikimedia.org',
					'sq22.wikimedia.org',
					'sq23.wikimedia.org',
					'sq24.wikimedia.org',
					'sq25.wikimedia.org',
					'sq26.wikimedia.org',
					'sq27.wikimedia.org',
					'sq28.wikimedia.org',
					'sq29.wikimedia.org',
					'sq30.wikimedia.org',

					'sq31.wikimedia.org',
					"sq32.wikimedia.org",
					"sq35.wikimedia.org",
					'sq38.wikimedia.org',
					'sq40.wikimedia.org',
				],
				"eqiad" => [],
				"esams" => [
					'knsq1.knams.wikimedia.org',
					'knsq2.knams.wikimedia.org',
					'knsq3.knams.wikimedia.org',
					'knsq4.knams.wikimedia.org',
					'knsq5.knams.wikimedia.org',
					'knsq6.knams.wikimedia.org',
					'knsq7.knams.wikimedia.org',

					"knsq30.knams.wikimedia.org"
				]
			},
			"api" => {
				"pmtpa" => [],
				"eqiad" => [],
				"esams" => [],
			},
			"bits" => {
				"pmtpa" => [],
				"eqiad" => [],
				"esams" => [
					"knsq1.esams.wikimedia.org",
					"knsq2.esams.wikimedia.org",
					"knsq4.esams.wikimedia.org",
					"knsq5.esams.wikimedia.org",
					"knsq6.esams.wikimedia.org",
					"knsq7.esams.wikimedia.org"
				],
			},
			"upload" => {
				"pmtpa" => [
					'sq1.wikimedia.org',
					'sq2.wikimedia.org',
					'sq3.wikimedia.org',
					'sq4.wikimedia.org',
					'sq5.wikimedia.org',
					'sq6.wikimedia.org',
					'sq7.wikimedia.org',
					'sq8.wikimedia.org',
					'sq9.wikimedia.org',
					'sq10.wikimedia.org',
					'sq11.wikimedia.org',
					'sq12.wikimedia.org',
					'sq13.wikimedia.org',
					'sq14.wikimedia.org',
					'sq15.wikimedia.org',
					'sq47.wikimedia.org',
				],
				"eqiad" => [],
				"esams" => [
					'knsq8.knams.wikimedia.org',
					'knsq9.knams.wikimedia.org',
					'knsq10.knams.wikimedia.org',
					'knsq11.knams.wikimedia.org',
					'knsq12.knams.wikimedia.org',
					'knsq13.knams.wikimedia.org',
					'knsq14.knams.wikimedia.org',
					'knsq15.knams.wikimedia.org'
				],
			},
			"mobile" => {
				"pmtpa" => [],
				"eqiad" => [],
				"esams" => []
			},
			"parsoid" => {
				"pmtpa" => [],
				"eqiad" => [],
				"esams" => []
			}
		}

		$backends = {
			'production' => {
				'appservers' => $lvs::configuration::lvs_service_ips['production']['apaches'],
				'api' => $lvs::configuration::lvs_service_ips['production']['api'],
				'rendering' => $lvs::configuration::lvs_service_ips['production']['rendering'],
				'bits_appservers' => {
					'pmtpa' => [ "srv248.pmtpa.wmnet", "srv249.pmtpa.wmnet", "mw60.pmtpa.wmnet", "mw61.pmtpa.wmnet" ],
					'eqiad' => [ "mw1149.eqiad.wmnet", "mw1150.eqiad.wmnet", "mw1151.eqiad.wmnet", "mw1152.eqiad.wmnet" ],
				},
				'test_appservers' => {
					'pmtpa' => [ "srv193.pmtpa.wmnet" ],
					'eqiad' => [ "srv193.pmtpa.wmnet" ],
				},
				'parsoid' => $lvs::configuration::lvs_service_ips['production']['parsoid']
			},
			'labs' => {
				'appservers' => {
					'pmtpa' => [
						'10.4.0.166',  # deployment-apache32
						'10.4.0.187',  # deployment-apache33
					],
				},
				'api' => {
					'pmtpa' => [
						'10.4.0.166',  # deployment-apache32
						'10.4.0.187',  # deployment-apache33
					],
				},
				'bits_appservers' => {
					'pmtpa' => [
						'10.4.0.166',  # deployment-apache32
						'10.4.0.187',  # deployment-apache33
					],
				},
				'test_appservers' => {
					'pmtpa' => [ '10.4.0.166' ],
				},
				'parsoid' => {
					'pmtpa' => [ '10.4.1.121' ], # deployment-parsoid2
				}
			}
		}
	}

	class squid {
		class common($role) {
			system_role { "role::cache::${role}": description => "${role} Squid cache server"}

			$cluster = "squids_${role}"
			$nagios_group = "cache_${role}_${::site}"

			include lvs::configuration

			include	standard,
				::squid

			class { "lvs::realserver": realserver_ips => $lvs::configuration::lvs_service_ips[$::realm][$role][$::site] }

			# Monitoring
			monitor_service {
				"frontend http":
					description => "Frontend Squid HTTP",
					check_command => $role ? {
						text => 'check_http',
						upload => 'check_http_upload',
					};
				"backend http":
					description => "Backend Squid HTTP",
					check_command => $role ? {
						text => 'check_http_on_port!3128',
						upload => 'check_http_upload_on_port!3128',
					};
			}

			# HTCP packet loss monitoring on the ganglia aggregators
			if $ganglia_aggregator and $::site != "esams" {
				include misc::monitoring::htcp-loss
			}
		}
	}

	class text {
		if ($::hostname in ['cp1037', 'cp1038', 'cp1039', 'cp1040'] or $::hostname =~ /^amssq(4[7-9]|[56][0-9])$/) or ($::realm == "labs" and $::hostname =~ /^deployment-cache-text/) {
			# Varnish

			$cluster = "cache_text"
			$nagios_group = "cache_text_${::site}"

			system_role { "role::cache::text": description => "text Varnish cache server" }

			include lvs::configuration, role::cache::configuration, network::constants

			class { "lvs::realserver": realserver_ips => $lvs::configuration::lvs_service_ips[$::realm]['text'][$::site] }

			$varnish_fe_directors = {
				# pmtpa is for labs / beta cluster
				"pmtpa" => { "backend" => $role::cache::configuration::active_nodes[$::realm]['text'][$::site] },
				# TODO: replace after removing Squid
				"eqiad" => { "backend" => $role::cache::configuration::active_nodes[$::realm]['text']["${::site}-varnish"] },
				# TODO: replace after removing Squid
				"esams" => { "backend" => $role::cache::configuration::active_nodes[$::realm]['text']["${::site}-varnish"] },
			}

			$varnish_be_directors = {
				"pmtpa" => {
					"backend" => $role::cache::configuration::backends[$::realm]['appservers'][$::mw_primary],
					"api" => $role::cache::configuration::backends[$::realm]['api'][$::mw_primary],
					"rendering" => $role::cache::configuration::backends[$::realm]['rendering'][$::mw_primary],
					"test_wikipedia" => $role::cache::configuration::backends[$::realm]['test_appservers'][$::mw_primary],
				},
				"eqiad" => {
					"backend" => $role::cache::configuration::backends[$::realm]['appservers'][$::mw_primary],
					"api" => $role::cache::configuration::backends[$::realm]['api'][$::mw_primary],
					"rendering" => $role::cache::configuration::backends[$::realm]['rendering'][$::mw_primary],
					"test_wikipedia" => $role::cache::configuration::backends[$::realm]['test_appservers'][$::mw_primary],
				},
				"esams" => {
					# TODO: replace after removing Squid
					"eqiad" => $role::cache::configuration::active_nodes[$::realm]['text']['eqiad-varnish'],
				},
			}

			$backend_weight = 100
			$storage_size_main = 100
			$storage_size_bigobj = 10
			if $::site == "eqiad" {
				$cluster_tier = 1
				$default_backend = "backend"
			} else {
				$cluster_tier = 2
				$default_backend = $::mw_primary
			}

			if regsubst($::memorytotal, "^([0-9]+)\.[0-9]* GB$", "\1") > 96 {
				$memory_storage_size = 16
			} elsif regsubst($::memorytotal, "^([0-9]+)\.[0-9]* GB$", "\1") > 32 {
				$memory_storage_size = 8
			} else {
				$memory_storage_size = 1
			}

			include standard,
				nrpe

			#class { "varnish::packages": version => "3.0.3plus~rc1-wm5" }

			varnish::setup_filesystem{
				$::hostname ? {
					default => ["sda3", "sdb3"]
				}:
				before => Varnish::Instance["text-backend"]
			}

			class { "varnish::htcppurger": varnish_instances => [ "127.0.0.1:80", "127.0.0.1:3128" ] }

			# Ganglia monitoring
			class { "varnish::monitoring::ganglia": varnish_instances => [ "", "frontend" ] }

			varnish::instance { "text-backend":
				name => "",
				vcl => "text-backend",
				extra_vcl => ["text-common"],
				port => 3128,
				admin_port => 6083,
				runtime_parameters => $::site ? {
					'esams' => ["prefer_ipv6=on", "default_ttl=86400"],
					default => [],
				},
				storage => $::hostname ? {
					default => "-s main-sda3=persistent,/srv/sda3/varnish.persist,${storage_size_main}G -s main-sdb3=persistent,/srv/sdb3/varnish.persist,${storage_size_main}G -s bigobj-sda3=file,/srv/sda3/large-objects.persist,${storage_size_bigobj}G -s bigobj-sdb3=file,/srv/sdb3/large-objects.persist,${storage_size_bigobj}G",
				},
				directors => $varnish_be_directors[$::site],
				director_type => $cluster_tier ? {
					1 => 'random',
					default => 'chash',
				},
				vcl_config => {
					'default_backend' => $default_backend,
					'retry503' => 1,
					'retry5xx' => 0,
					'cache4xx' => "1m",
					'purge_regex' => '^http://(?!upload\.wikimedia\.org)',
					'cluster_tier' => $cluster_tier,
					'layer' => 'backend',
				},
				backend_options => [
					{
						'backend_match' => "^cp[0-9]+\.eqiad\.wmnet$",
						'port' => 3128,
						'probe' => "varnish",
					},
					{
						'backend_match' => "^srv193\.pmtpa\.wmnet$",
						'max_connections' => 20,
					},
					{
						'port' => 80,
						'connect_timeout' => "5s",
						'first_byte_timeout' => "30s",
						'between_bytes_timeout' => "4s",
						'max_connections' => 1000,
						'weight' => $backend_weight,
					}],
				wikimedia_networks => $network::constants::all_networks,
				xff_sources => $network::constants::all_networks
			}

			varnish::instance { "text-frontend":
				name => "frontend",
				vcl => "text-frontend",
				extra_vcl => ["text-common"],
				port => 80,
				admin_port => 6082,
				storage => "-s malloc,${memory_storage_size}G",
				directors => $varnish_fe_directors[$::site],
				director_type => "chash",
				vcl_config => {
					'retry503' => 1,
					'retry5xx' => 0,
					'cache4xx' => "1m",
					'purge_regex' => '^http://(?!upload\.wikimedia\.org)',
					'cluster_tier' => $cluster_tier,
					'layer' => 'frontend',
				},
				backend_options => [
					{
						'port' => 3128,
						'connect_timeout' => "5s",
						'first_byte_timeout' => "35s",
						'between_bytes_timeout' => "2s",
						'max_connections' => 100000,
						'probe' => "varnish",
						'weight' => $backend_weight,
					}],
				xff_sources => $network::constants::all_networks,
			}

			# TODO
			varnish::logging { 'emery' :           listener_address => '208.80.152.184' , cli_args => "-m RxRequest:^(?!PURGE\$) -D" }
			varnish::logging { 'multicast_relay' : listener_address => '208.80.154.73' , port => '8419', cli_args => "-m RxRequest:^(?!PURGE\$) -D" }

			# HTCP packet loss monitoring on the ganglia aggregators
			if $ganglia_aggregator and $::site != "esams" {
				include misc::monitoring::htcp-loss
			}
		}
		else {
			class { "role::cache::squid::common": role => "text" }
		}
	}

	class upload {
		# FIXME: remove this hack
		if $::site in ["eqiad","esams"] or $::realm == 'labs' {
			# Varnish

			$cluster = "cache_upload"
			$nagios_group = "cache_upload_${::site}"

			system_role { "role::cache::upload": description => "upload Varnish cache server" }

			include lvs::configuration, role::cache::configuration, network::constants

			class { "lvs::realserver": realserver_ips => $lvs::configuration::lvs_service_ips[$::realm]['upload'][$::site] }

			$varnish_fe_directors = {
				# pmtpa is for labs / beta cluster
				"pmtpa" => { "backend" => $role::cache::configuration::active_nodes[$::realm]['upload'][$::site] },
				"eqiad" => { "backend" => $role::cache::configuration::active_nodes[$::realm]['upload'][$::site] },
				"esams" => { "backend" => $role::cache::configuration::active_nodes[$::realm]['upload'][$::site] },
			}

			$varnish_be_directors = {
				"pmtpa" => {
					"backend" => $lvs::configuration::lvs_service_ips[$::realm]['upload']['pmtpa']['uploadsvc'],
					"rendering" => $role::cache::configuration::backends[$::realm]['rendering'][$::mw_primary],
				},
				"eqiad" => {
					"backend" => $lvs::configuration::lvs_service_ips[$::realm]['swift']['pmtpa'],
					"rendering" => $role::cache::configuration::backends[$::realm]['rendering'][$::mw_primary],
				},
				"esams" => {
					"eqiad" => $role::cache::configuration::active_nodes[$::realm]['upload']['eqiad']
				}
			}

			$backend_weight = 20
			if $::site == "eqiad" {
				$storage_size_main = 100
				$storage_size_bigobj = 10
				$cluster_tier = 1
				$default_backend = 'backend'
			} else {
				$storage_size_main = 300
				$storage_size_bigobj = 50
				$cluster_tier = 2
				$default_backend = 'eqiad'
			}

			if regsubst($::memorytotal, "^([0-9]+)\.[0-9]* GB$", "\1") > 96 {
				$memory_storage_size = 16
			} elsif regsubst($::memorytotal, "^([0-9]+)\.[0-9]* GB$", "\1") > 32 {
				$memory_storage_size = 8
			} else {
				$memory_storage_size = 1
			}

			include standard,
				nrpe

			#class { "varnish::packages": version => "3.0.3plus~rc1-wm5" }

			varnish::setup_filesystem{
				$::hostname ? {
					'dysprosium' => ["sdc1", "sdd1"],
					default => ["sda3", "sdb3"]
				}:
				before => Varnish::Instance["upload-backend"]
			}

			class { "varnish::htcppurger": varnish_instances => [ "127.0.0.1:80", "127.0.0.1:3128" ] }

			# Ganglia monitoring
			class { "varnish::monitoring::ganglia": varnish_instances => [ "", "frontend" ] }

			varnish::instance { "upload-backend":
				name => "",
				vcl => "upload-backend",
				port => 3128,
				admin_port => 6083,
				runtime_parameters => $::site ? {
					'esams' => ["prefer_ipv6=on", "default_ttl=86400"],
					default => [],
				},
				storage => $::hostname ? {
					'dysprosium' => "-s main-sda1=persistent,/srv/sdc1/varnish.persist,300G -s main-sdb1=file,/srv/sdd1/varnish.persist,300G -s bigobj-sda1=file,/srv/sdc1/large-objects.persist,50G -s bigobj-sdb1=file,/srv/sdd1/large-objects.persist,50G",
					default => "-s main-sda3=persistent,/srv/sda3/varnish.persist,${storage_size_main}G -s main-sdb3=persistent,/srv/sdb3/varnish.persist,${storage_size_main}G -s bigobj-sda3=file,/srv/sda3/large-objects.persist,${storage_size_bigobj}G -s bigobj-sdb3=file,/srv/sdb3/large-objects.persist,${storage_size_bigobj}G",
				},
				directors => $varnish_be_directors[$::site],
				director_type => "random",
				vcl_config => {
					'default_backend' => $default_backend,
					'retry5xx' => 0,
					'cache4xx' => "1m",
					'purge_regex' => '^http://upload\.wikimedia\.org/',
					'cluster_tier' => $cluster_tier,
					'layer' => 'backend',
				},
				backend_options => [
					{
						'backend_match' => "^dysprosium\.eqiad\.wmnet$",
						'weight' => 4 * $backend_weight,
					},
					{
						'backend_match' => "^cp[0-9]+\.eqiad\.wmnet$",
						'port' => 3128,
						'probe' => "varnish",
					},
					{
						'port' => 80,
						'connect_timeout' => "5s",
						'first_byte_timeout' => "35s",
						'between_bytes_timeout' => "4s",
						'max_connections' => 1000,
						'weight' => $backend_weight,
					}],
				wikimedia_networks => $network::constants::all_networks,
				xff_sources => $network::constants::all_networks
			}

			varnish::instance { "upload-frontend":
				name => "frontend",
				vcl => "upload-frontend",
				port => 80,
				admin_port => 6082,
				storage => "-s malloc,${memory_storage_size}G",
				directors => $varnish_fe_directors[$::site],
				director_type => "chash",
				vcl_config => {
					'retry5xx' => 0,
					'cache4xx' => "1m",
					'purge_regex' => '^http://upload\.wikimedia\.org/',
					'cluster_tier' => $cluster_tier,
					'layer' => 'frontend',
				},
				backend_options => [
					{
						'backend_match' => "^dysprosium\.eqiad\.wmnet$",
						'weight' => 4 * $backend_weight,
					},
					{
						'port' => 3128,
						'connect_timeout' => "5s",
						'first_byte_timeout' => "35s",
						'between_bytes_timeout' => "2s",
						'max_connections' => 100000,
						'probe' => "varnish",
						'weight' => $backend_weight,
					}],
				xff_sources => $network::constants::all_networks,
			}

			varnish::logging { 'emery' :           listener_address => '208.80.152.184' , cli_args => "-m RxRequest:^(?!PURGE\$) -D" }
			varnish::logging { 'multicast_relay' : listener_address => '208.80.154.73' , port => '8419', cli_args => "-m RxRequest:^(?!PURGE\$) -D" }

			# HTCP packet loss monitoring on the ganglia aggregators
			if $ganglia_aggregator and $::site != "esams" {
				include misc::monitoring::htcp-loss
			}
		}
		else {
			# Squid
			class { "role::cache::squid::common": role => "upload" }
		}
	}

	class bits {
		include network::constants

		$cluster = "cache_bits"
		$nagios_group = "cache_bits_${::site}"

		include lvs::configuration, role::cache::configuration

		class { "varnish::packages": version => "3.0.3plus~rc1-wm10" }

		class { "lvs::realserver": realserver_ips => $lvs::configuration::lvs_service_ips[$::realm]['bits'][$::site] }

		$common_cluster_options = {
			'test_hostname' => "test.wikipedia.org",
			'enable_geoiplookup' => true,
		}

		case $::realm {
			'production': {
				case $::site {
					'pmtpa','eqiad': {
						$varnish_directors = {
							"backend" => $::role::cache::configuration::backends[$::realm]['bits_appservers'][$::mw_primary],
							"test_wikipedia" => $::role::cache::configuration::backends[$::realm]['test_appservers'][$::mw_primary],
						}
						$probe = "bits"
					}
					default: {
						$varnish_directors = {
							"backend" => [ "208.80.152.210", "208.80.154.234" ] # [ bits-lb.pmtpa, bits-lb.eqiad ]
						}
						$probe = "varnish"
					}
				}
				$cluster_options = $common_cluster_options
			}
			'labs': {
				$varnish_directors = {
					"backend" => $::role::cache::configuration::backends[$::realm]['bits_appservers'][$::mw_primary],
					"test_wikipedia" => $::role::cache::configuration::backends[$::realm]['test_appservers'][$::mw_primary],
				}
				$cluster_options = merge($common_cluster_options, {
					'top_domain' => 'beta.wmflabs.org',
					'bits_domain' => 'bits.beta.wmflabs.org',
				})
				$probe = "bits"
			}
		}

		system_role { "role::cache::bits": description => "bits Varnish cache server" }

		require geoip

		include standard,
			varnish::monitoring::ganglia,
			nrpe

		varnish::instance { "bits":
			name => "",
			vcl => "bits",
			port => 80,
			admin_port => 6082,
			storage => "-s malloc,2G",
			directors => $varnish_directors,
			director_type => "random",
			vcl_config => {
				'retry503' => 4,
				'retry5xx' => 1,
				'cache4xx' => "1m",
				'layer' => 'frontend',
			},
			backend_options => {
				'port' => 80,
				'connect_timeout' => "5s",
				'first_byte_timeout' => "35s",
				'between_bytes_timeout' => "4s",
				'max_connections' => 10000,
				'probe' => $probe,
			},
			cluster_options => $cluster_options,
			xff_sources => $network::constants::all_networks
		}
		
		cron { "alloc failure":
			command => "test $(varnishstat -1 -f SMA.s0.c_fail | awk '{ print \$2 }') -gt 100 && service varnish restart > /var/log/varnish-restarts",
			user => root,
			ensure => absent
		}
		
		class logging {
			if $::realm == 'production' {
				$event_listener = $::site ? {
					/^(pmtpa|eqiad)$/ => '10.64.21.123', # vanadium
					'esams'           => '208.80.154.73', # gadolinium
				}

				varnish::logging { 'kraken' :
					listener_address => '208.80.154.154', # analytics1001
					port             => '8422',
					instance_name    => '',
					cli_args         => "-m RxURL:^/event\.gif\?. -D",
					log_fmt          => "%U	%q	%{Host}i	%t	%h	%{X-Forwarded-For}i	%{Referer}i	%{Accept-Language}i	%{Cookie}i	%{X-WAP-Profile}i	%{User-agent}i	%l	%n",
					monitor          => false,
				}
			}
			else {
				$event_listener = '10.4.0.48' # deployment-eventlogging
			}

			varnish::logging { 'vanadium' :
				listener_address => $event_listener,
				port             => '8422',
				instance_name    => '',
				cli_args         => "-m RxURL:^/event\.gif\?. -D",
				log_fmt          => "%q	%l	%n	%t	%h",
				monitor          => false,
			}
		}
		
		include logging
	}

	class mobile {
		include network::constants
		include role::cache::configuration

		$cluster = "cache_mobile"
		$nagios_group = "cache_mobile_${::site}"

		include lvs::configuration, role::cache::configuration

		class { "lvs::realserver": realserver_ips => $lvs::configuration::lvs_service_ips[$::realm]['mobile'][$::site] }

		system_role { "role::cache::mobile": description => "mobile Varnish cache server" }

		include standard,
			nrpe

		$storage_backends = $::realm ? {
			'production' => ["sda3", "sdb3"],
			'labs' => ["vdb"],
		}
		varnish::setup_filesystem{ $storage_backends:
			before => Varnish::Instance["mobile-backend"]
		}

		class { "varnish::htcppurger": varnish_instances => [ "127.0.0.1:80", "127.0.0.1:81" ] }

		# Ganglia monitoring
		class { "varnish::monitoring::ganglia": varnish_instances => [ "", "frontend" ] }

		varnish::instance { "mobile-backend":
			name => "",
			vcl => "mobile-backend",
			port => 81,
			admin_port => 6083,
			storage => $::realm ? {
				'production' => "-s sda3=persistent,/srv/sda3/varnish.persist,100G -s sdb3=persistent,/srv/sdb3/varnish.persist,100G",
				'labs' => '-s vdb=persistent,/srv/vdb/varnish.persist,19G',
			},
			directors => {
				"backend" => $role::cache::configuration::backends[$::realm]['appservers'][$::mw_primary],
				"api" => $role::cache::configuration::backends[$::realm]['api'][$::mw_primary],
				"test_wikipedia" => $role::cache::configuration::backends[$::realm]['test_appservers'][$::mw_primary],
			},
			director_options => {
				'retries' => 2,
			},
			vcl_config => {
				'retry503' => 4,
				'retry5xx' => 1,
				'purge_regex' => '^http://(?!upload\.wikimedia\.org)',
				'layer' => 'backend',
			},
			backend_options => [
				{
					'backend_match' => "^srv193\.pmtpa\.wmnet$",
					'max_connections' => 20,
				},
				{
					'port' => 80,
					'connect_timeout' => "5s",
					'first_byte_timeout' => "35s",
					'between_bytes_timeout' => "4s",
					'max_connections' => 600,
				}],
			xff_sources => $network::constants::all_networks
		}

		varnish::instance { "mobile-frontend":
			name => "frontend",
			vcl => "mobile-frontend",
			extra_vcl => ["zero"],
			port => 80,
			admin_port => 6082,
			directors => {
				"backend" => $::role::cache::configuration::active_nodes[$::realm]['mobile'][$::site],
			},
			director_options => {
				'retries' => 40,
			},
			director_type => "chash",
			vcl_config => {
				'retry5xx' => 0,
				'purge_regex' => '^http://(?!upload\.wikimedia\.org)',
				'layer' => 'frontend',
			},
			backend_options => {
				'port' => 81,
				'connect_timeout' => "5s",
				'first_byte_timeout' => "35s",
				'between_bytes_timeout' => "2s",
				'max_connections' => 100000,
				'probe' => "varnish",
			},
			xff_sources => $network::constants::all_networks,
		}

		if( $::realm == 'production' ) {
			varnish::logging { 'emery' :           listener_address => '208.80.152.184', cli_args => "-m RxRequest:^(?!PURGE\$) -D" }
			varnish::logging { 'multicast_relay' : listener_address => '208.80.154.73', port => '8419', cli_args => "-m RxRequest:^(?!PURGE\$) -D" }
		}
	}

	class parsoid {
		include network::constants
		include role::cache::configuration

		$cluster = "cache_parsoid"
		$nagios_group = "cache_parsoid_${::site}"

		include lvs::configuration, role::cache::configuration

		if ( $::realm == 'production' ) {
			class { "lvs::realserver": realserver_ips => $lvs::configuration::lvs_service_ips[$::realm]['parsoidcache'][$::site] }
		}

		system_role { "role::cache::parsoid": description => "Parsoid Varnish cache server" }

		include standard,
			nrpe

		$storage_backends = $::realm ? {
			'production' => $::hostname ? {
				"titanium" => ["sdb1", "sdd1"],
				"cerium" => ["sda1", "sdb1"],
				default => []
			},
			'labs' => ["vdb"],
		}
		varnish::setup_filesystem{ $storage_backends:
			before => Varnish::Instance["parsoid-backend"]
		}

		class { "varnish::htcppurger": varnish_instances => [ "localhost:80", "localhost:3128" ] }

		# Ganglia monitoring
		if ( $::realm == 'production' ) {
			class { "varnish::monitoring::ganglia": varnish_instances => [ "", "frontend" ] }
		}

		varnish::instance { "parsoid-backend":
			name => "",
			vcl => "parsoid-backend",
			extra_vcl => ["parsoid-common"],
			port => 3128,
			admin_port => 6083,
			storage => $::realm ? {
				'production' => $::hostname ? {
					"titanium" => "-s sdb1=persistent,/srv/sdb1/varnish.persist,139G -s sdd1=persistent,/srv/sdd1/varnish.persist,139G",
					"cerium" => "-s sda1=persistent,/srv/sda1/varnish.persist,139G -s sdb1=persistent,/srv/sdb1/varnish.persist,139G",
				},
				'labs' => '-s vdb=persistent,/srv/vdb/varnish.persist,19G',
			},
			directors => {
				"backend" => $role::cache::configuration::backends[$::realm]['parsoid'][$::mw_primary],
			},
			director_options => {
				'retries' => 2,
			},
			vcl_config => {
				'retry5xx' => 1,
			},
			backend_options => [
				{
					'port' => 8000,
					'connect_timeout' => "5s",
					'first_byte_timeout' => "60s",
					'between_bytes_timeout' => "4s",
					'max_connections' => 600,
				}],
			xff_sources => $network::constants::all_networks
		}

		varnish::instance { "parsoid-frontend":
			name => "frontend",
			vcl => "parsoid-frontend",
			extra_vcl => ["parsoid-common"],
			port => 80,
			admin_port => 6082,
			directors => {
				"backend" => $::role::cache::configuration::active_nodes[$::realm]['parsoid'][$::site],
			},
			director_type => "chash",
			vcl_config => {
				'retry5xx' => 0,
			},
			backend_options => {
				'port' => 3128,
				'connect_timeout' => "5s",
				'first_byte_timeout' => "60s",
				'between_bytes_timeout' => "2s",
				'max_connections' => 100000,
				'probe' => "varnish",
			},
			xff_sources => $network::constants::all_networks,
		}
	}
}
