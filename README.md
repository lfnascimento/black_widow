[![Build Status](https://travis-ci.com/lfnascimento/black_widow.svg?branch=master)](https://travis-ci.com/lfnascimento/black_widow)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/lfnascimento/black_widow)
# Black Widow - Bank Accounting

To run this project you need to have:

- **Docker**

## Setup the project
```
$ git clone https://github.com/lfnascimento/black_widow.git
$ cd black_widow
$ docker-compose build
$ docker-compose run bin/setup
# Run the specs to check if everything is working ok and coverage
$ docker-compose run app bundle exec rspec
```

## Running the project

```$ docker-compose up -d```

## Usage
Please check the DOC. Open http://localhost:3000
