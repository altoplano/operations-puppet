# Temporary puppetization of interim needs while
# Analytics and ops works together to review and puppetize
# Kraken in the production branch of operations/puppet.
# This file will be deleted soon.


# Syncs an HDFS directory to $rsync_destination via rsync hourly
define misc::analytics::hdfs::sync($hdfs_source, $rsync_destination, $tmp_dir = "/a/hdfs_sync.tmp") {
	require misc::statistics::user

	file { $tmp_dir:
		ensure => directory,
		owner  => $misc::statistics::user::username,
	}

	$local_tmp_dir = "${tmp_dir}/${name}"
	$command       = "/bin/rm -rf ${local_tmp_dir} && /usr/bin/hadoop fs -get ${hdfs_source} ${local_tmp_dir} && /usr/bin/rsync -rt --delete ${local_tmp_dir}/ ${rsync_destination} && /bin/rm -rf ${local_tmp_dir}"

	# Create an hourly cron job to rsync to $rsync_destination.
	cron { "hdfs_sync_${name}":
		command => $command,
		user    => $misc::statistics::user::username,
		minute  => 15,
		require => File[$tmp_dir],
	}
}


class misc::analytics::monitoring::kafka::server {
	# Set up icinga monitoring of Kafka broker server produce requests per second.
	# If this drops too low, trigger an alert
	# for this udp2log instance.
	monitor_service { "kakfa-broker-ProduceRequestsPerSecond":
		description           => "kafka_network_SocketServerStats.ProduceRequestsPerSecond",
		check_command         => "check_kafka_broker_produce_requests!3!2",
		contact_group         => "analytics",
	}
}
