node default {
	# include users
	# include ssh
	# include git
	include utils
	# include privileges
	include 'docker'
	# include keys
	# include docker_images
	# include vim_setup
	# include set_time_zone
	# include locale_set_up
	# include ruby_set_up
}