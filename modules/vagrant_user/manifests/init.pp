class users {
	# resources

	user { 'vagrant':
		ensure => 'present',
		groups => ['sudo', 'docker'],
	}

}