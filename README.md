[![Build Status](https://travis-ci.com/lfnascimento/black_widow.svg?branch=master)](https://travis-ci.com/lfnascimento/black_widow)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/lfnascimento/black_widow)
[![Maintainability](https://api.codeclimate.com/v1/badges/2344afad59a243e636e5/maintainability)](https://codeclimate.com/github/lfnascimento/black_widow/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/2344afad59a243e636e5/test_coverage)](https://codeclimate.com/github/lfnascimento/black_widow/test_coverage)
# Black Widow - Bank Accounting

To run this project you need to have:

- **Docker**

## Setup the project
```
$ git clone https://github.com/lfnascimento/black_widow.git
$ cd black_widow
$ docker-compose build
$ docker-compose run app bin/setup
# Run the specs to check if everything is working ok and coverage
$ docker-compose run app bundle exec rspec
```

## Running the project

```$ docker-compose up```

## Usage
[Examples](https://documenter.getpostman.com/view/8746814/SzKYPxAH)

Please check the DOC for further information. Open http://localhost:3000
