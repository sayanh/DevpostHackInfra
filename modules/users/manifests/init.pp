# Class: users
#
#
class users {
	# resources

	user { 'shazra':
		ensure => 'present',
		groups => ['sudo'],
		home => '/home/shazra',
		managehome => true,
		password => '$6$lY2Gp3Cr$zNrUB7T3yibUF/gWn5cTQ0fNv7MUmx/DZuw3E7I..Vh9tITG28BtgvXJPU4Gm4Z/9oNvlbX24KzQ9Ib1QH1B9.',
		shell => '/bin/bash',
	}

	group { 'docker':
		ensure => 'present',
		gid => '502',
	}
	

	file { '/home/shazra':
		ensure => directory,
		owner => 'shazra',
		mode => 755,
		source => 'puppet:///modules/users/shazra',
		recurse => remote,
		require => User['shazra'],
	}

	file { '/etc/ssh/sudoers':
		ensure => present,
		owner => root,
		group => root,
		mode => 600,
		source => "puppet:///modules/users/shazra/sudoers",
	}

	ssh_authorized_key { 'shazra':
		ensure => 'present',
		user => 'shazra',
		type => 'rsa',
		key => 'AAAAB3NzaC1yc2EAAAADAQABAAACAQDD1lB5MUAj6tN0pvSkSb/v3GZIGW5gPFoJP4bs6BN8RTXcSwPI/+IZZ/r70c8gmzjMuFX1y74/xllUSLtzFGWfmBR2qMaCzwL4L3hS7IbPegPG9LGILwzBiJ0D4dejDfJUZw+cH0neI46gCPo19qsmWG+5shELR6LIkY9tCEUa+MsuIWPzi2tQAJABTR6CXhOhaV0yLw0IPxEwlbNRy+2RHhaL/8mfcytz3ekAameco6683hjBYs2zH4AdhbAqHnaOxipkMxJHOq6++qT3rhosxUEhSb7F08gnxK7OMZBUceih0HqOFazFHnbMsTEVA22svtPIKam/JtUTKhQzAVYc9gCh+6qcnMClIiKdENzdWW/oTXZj2iNYI1luLWzrETW8x5Nmo0iJv7aL/4dxz9mW/OgdFu5tGIIm5vC00kzxGziQfdkenl6dr9Vikm+4/9KbaYjYzeO/6N1MS8uWqX01/pPRppyW8xm5TFri1UI99RJ/vnLlw+ep0JcOTl3BgBa1inZl0ybT7J2J885xgYHAVknIIicDmVep8IY8ItNq+U1HZdxNgzPSPHuAsqwQdDuRPwdZX/LYuWns44l12y02nLm6MS4zpbXQXK0bBaagmwCJcHj1xhhSoynl7LAhlgf+FzZ5eGrwwk1cTWy3+6/IAf/NahSh7paoGkMEtW9Q8w=='
	}	


	# vcsrepo { '/home/shazra':
	# 	ensure => mirror,
	#     provider => git,
	#   	source => 'git@github.com:sayanh/dotfiles.git',
	# }
}