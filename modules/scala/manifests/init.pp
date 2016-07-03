class scala {
	# resources

	include scala::install
}

class scala::install {

	package { 'scala':
		ensure => present,
	}

	file { 'install_sbt':
      ensure => 'file',
      source => 'puppet:///modules/scala/install_sbt.sh',
      path => '/usr/local/bin/install_sbt.sh',
      owner => 'root',
      group => 'root',
      mode  => '0744', 
      notify => Exec['run_my_script'],
  	}

  	exec { 'run_my_script':
      command => '/usr/local/bin/install_sbt.sh',
      refreshonly => true,
  	}

}