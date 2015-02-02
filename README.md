ImageShop API
=============

API for ImageShop. This API allows the client to resize and crop images using HTTP requests.

### Quick Start
- bundle
- Setup a postgres database with an image_shop user that can create databases and login with the credential 'password'.
(See config/database.yml for details)
- rake db:create
- rake db:migrate
- rails s

### Quick Test
Image Resizing: Use the url below to test image resizing.
http://localhost:3000/images/resize_image?url=http%3A%2F%2Fwww.clipartbest.com%2Fcliparts%2FKTj%2F49G%2FKTj49GATq.jpeg&width=300&height=200

Image Cropping: Use the url below to test image croping.
http://localhost:3000/images/crop_image?url=http%3A%2F%2Fwww.clipartbest.com%2Fcliparts%2FKTj%2F49G%2FKTj49GATq.jpeg&width=200&height=400&upper_left_corner%5Bx%5D=40&upper_left_corner%5By%5D=50

### Apipie Documentation
To view the Apipie documentation, visit the following url.
- http://localhost:3000/apipie

### Running Tests
To run both Cucumber and Rspec tests, run the following command in the root directory.
- rake

To run just the Rspec tests, run the following command in the root directory.
- rspec

Currently, no cucumber tests have been written.
To run just the Cucumber tests, run the following command in the root directory.
- cucumber

To view the test coverage report, run the following command after running the rspec tests.
- firefox coverage/index.html
- open coverage/index.html (on MacOSX)

There are two reasons the test coverage is not 100%.
* I didn't ensure 100% test coverage for methods created through rails generators. Some of that code is extraneous.
* I didn't finish writing specs for all the error handling code. As a result, the application_controller does not have 100% coverage.
