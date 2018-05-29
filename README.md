# Machinery Maintenance
[![Build Status](https://travis-ci.org/Wragdan/machinery_manteinance.svg?branch=develop)](https://travis-ci.org/Wragdan/machinery_manteinance)
[![Coverage Status](https://coveralls.io/repos/github/Wragdan/machinery_manteinance/badge.svg?branch=develop)](https://coveralls.io/github/Wragdan/machinery_manteinance?branch=develop)

Made with Ruby 2.4.0 and Rails 5.1.0

Project for Honducaribe made by UNITEC students of the Software Engineering II class (2017 Period II),
being worked on by UNITEC studentes of the Software Engineering I class (2018 Period II)

Check out the [Demo](https://machinery-maintenance.herokuapp.com/)

# Get Started

Clone the repository
```bash
git clone https://github.com/Wragdan/machinery_maintenance.git
```

Install gems

```bash
bundle install
# or
bundle
```

Install other dependencies (used for AdminLTE template)

```bash
npm install
#  or
yarn install
```

Create the database (optional in sqlite)

```bash
rails db:create
```

Migrate the database

```bash
rails db:migrate
```

Add admin user (seeds.rb)

```bash
rails db:seed
```

Run it on localhost

```bash
rails s
```