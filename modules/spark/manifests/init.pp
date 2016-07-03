# Class: spark
#
#
class spark {
	# resources
	include spark::install
}

# Class: spark::install
#
#
class spark::install {
	# resources

	file { 'install_spark':
      ensure => 'file',
      source => 'puppet:///modules/spark/install_spark.sh',
      path => '/home/vagrant/install_spark.sh',
      owner => 'vagrant',
      group => 'vagrant',
      mode  => '0777', 
      notify => Exec['spark_setup_script'],
  	}

  	exec { 'spark_setup_script':
      command => '/home/vagrant/install_spark.sh',
      refreshonly => true,
  	}
}