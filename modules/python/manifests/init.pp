class python {
	# resources

	include python::install
}

class python::install {

	package { 'python':
		ensure => present,
	}

	file { 'install_python':
      ensure => 'file',
      source => 'puppet:///modules/python/install_python_latest.sh',
      path => '/usr/local/bin/install_sbt.sh',
      owner => 'root',
      group => 'root',
      mode  => '0744', 
      notify => Exec['install_python_script'],
  	}

  	exec { 'install_python_script':
      command => '/usr/local/bin/install_sbt.sh',
      refreshonly => true,
  	}

}