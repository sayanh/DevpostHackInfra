# Class: git
#
#
class git {
	# resources

	include git::install
}


# Class: git::install
#
#
class git::install {
	# resources

	# package { 'git':
	# 	ensure => installed,
	# }

	# git::clone { 'sayanh/dotfiles':
	# 	path => '/home/shazra',
	# 	dir => 'dotfiles',

	# }
	### Cloning the dot files
	vcsrepo { "/home/shazra/dotfiles":
	   user => 'shazra',
	   provider => git,
	   ensure => latest,
	   source  => 'https://github.com/sayanh/dotfiles',
	   revision => 'master',
	   require => User['shazra'],
	   submodules => false,
	}

	### Cloning Vundle for vim
	vcsrepo { "/home/shazra/.vim/bundle/Vundle.vim":
	   user => 'shazra',
	   provider => git,
	   ensure => latest,
	   source  => 'https://github.com/VundleVim/Vundle.vim',
	   revision => 'master',
	   require => User['shazra'],
	   submodules => false,
	}

	file { '/home/shazra/.vimrc':
		ensure => 'link',
		target => '/home/shazra/dotfiles/.vimrc',
		owner => 'shazra',
		# user => 'shazra',
		# require => ['/home/shazra/dotfiles/.vimrc'],
	}

	file { '/home/shazra/.bashrc':
		ensure => 'link',
		target => '/home/shazra/dotfiles/.bashrc',
		owner => 'shazra',
		# user => 'shazra',
		# require => File['/home/shazra/dotfiles/.bashrc'],
	}

}


# Define: git::clone
# Parameters:
# arguments
#
# define git::clone ( $path, $dir) {
# 	# puppet code
# 	exec { "clone-$name-$path":
# 		command => "/usr/bin/git clone git@github.com:$name $path/$dir",
# 		creates => "$path/$dir",
# 		require => [Class["git"], File[$path]],
# 	}
# }