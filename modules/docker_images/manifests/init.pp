# Class: docker_images
#
#
class docker_images {
	# resources

	include docker_images::install
}

class docker_images::install {
	docker::image { "ubuntu":
		image_tag => 'precise',
	}
}