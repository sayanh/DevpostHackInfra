# Class: ruby
#
#
class ruby {
	# resources
	include ruby::install
}

# Class: ruby::install
#
#
class ruby::install {
	# resources

	### Cloning the dot files
	vcsrepo { "/home/vagrant/.rbenv":
	   user => 'vagrant',
	   provider => git,
	   ensure => latest,
	   source  => 'https://github.com/rbenv/rbenv.git',
	   revision => 'master',
	   require => File['rbenv_dir'],
	   submodules => false,
	}

	file { 'rbenv_dir':
		ensure => file,
	}
}
