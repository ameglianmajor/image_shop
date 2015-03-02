# ImageShop API

API for ImageShop. This API allows the client to resize and crop images using
HTTP requests.

## Quick Start

1. Install [rvm](https://rvm.io/rvm/install) or
   [rbenv](https://github.com/sstephenson/rbenv#installation) if one of them is
   not already installed.
2. Install ruby-2.1.5 if it is not already installed.
3. Install bundler with the following command if it is not already installed.

   ```bash
   gem install bundler
   ```
4. After checking out the image_shop github repository into a local directory,
   use bundler to install the required dependencies. Some of the dependencies
   may require the installation of system packages.

   ```bash
   bundle
   ```
5. Setup a postgres database with an image_shop user that can create databases
   and login with the credential 'password'. See config/database.yml for
   configuration details. This can be done in many ways, but the following
   commands may be useful. However, they may not work depending on your
   operating system.
  1. At the bash prompt, start psql to setup a user for the first time.

     ```bash
     sudo -u postgres psql template1
     ```
  2. At the psql prompt, create an image_shop user that can create databases
     and login using the password 'password'.

     ```psql
     create role image_shop with createdb login password 'password';
     ```
6. Run the following commands at the bash prompt to create development and test
   databases, run the migrations, and start the rails server.

   ```bash
   rake db:create
   rake db:migrate
   rails s
   ```

## Quick Test

Once the Image Shop Api is running locally on port 3000, the subsections below
describe how to test image resizing and image cropping.

### Image Resizing

The following url can be used to test image resizing if the Image Shop api is
running locally on port 3000.

http://localhost:3000/images/resize_image?url=http%3A%2F%2Fwww.clipartbest.com%2Fcliparts%2FKTj%2F49G%2FKTj49GATq.jpeg&width=300&height=200

### Image Cropping

The following url can be used to test image croping if the Image Shop api is
running locally on port 3000.

http://localhost:3000/images/crop_image?url=http%3A%2F%2Fwww.clipartbest.com%2Fcliparts%2FKTj%2F49G%2FKTj49GATq.jpeg&width=100&height=200&upper_left_corner%5Bx%5D=40&upper_left_corner%5By%5D=50

## Apipie Documentation

To view the Apipie documentation, visit the following url after running Image
Shop locally on port 3000.

http://localhost:3000/apipie

## Tests

This section is broken down into a section for running tests and a section for
viewing the test coverage report.

### Running Tests

To run both Cucumber and Rspec tests, run the following command in the root
directory.

```bash
rake
```

To run just the Rspec tests, run the following command in the root directory
of the image_shop web application.

```bash
rspec
```

Currently, no cucumber tests have been written. To run just the Cucumber
tests, run the following command in the root directory of the image_shop
web application.

```bash
cucumber
```

### Viewing Test Coverage Report

To view the test coverage report, run the following command after running
the rspec tests. These commands should be run from the root directory of
the image_shop web application.

Ubuntu

```bash
firefox coverage/index.html
```

Mac OSX

```bash
open coverage/index.html
```
