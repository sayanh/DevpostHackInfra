node default {
	include users
	include ssh
	include git
	include utils
	include 'docker'
	# include docker_images
}