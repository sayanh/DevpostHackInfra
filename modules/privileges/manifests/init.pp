# Class: privileges
#
#
class privileges {
	# resources

	sudo::conf { 'shazra':
    	priority => 30,
	    content  => 'shazra ALL=(ALL) NOPASSWD:ALL',
  	}

  	sudo::conf { 'vagrant':
    	priority => 30,
	    content  => 'vagrant ALL=(ALL) NOPASSWD:ALL',
  	}

  	# sudo::conf { 'default editor':
  	# 	content => 'Defaults editor=/usr/bin/vim',
  	# }
}