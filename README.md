Watir-Amaysim-Cucumber
======================

Watir-Amaysim-Cucumber is a sample test suite running via a browser for checking running business rules and user flows for the `My Amaysim` app's settings management feature, built as a technical exercise. The test suite runs in `Ruby`, integrated to a number of gems, namely `Cucumber` for writing tests in Gherkin format, `Watir` for automating the browser, `Page-Object` for managing page elements, among others.

![demo1](screenshots/watir-myamaysim-cucumber.gif)

## Setup

1. Install Ruby and the Ruby Development Kit
2. Clone or download this repository
3. Open a terminal / command line of your choice and navigate to your local repository
4. Run `gem install bundler` to install the bundler gem
5. Run `bundle install` to install gem dependencies
6. Have a Google Chrome or Mozilla Firefox browser installed in your machine

## Server Name Options

* `-p staging` for Staging
* `-p production` for Production (default)

Note: There isn't any actual difference in the two servers at the moment.

## Running Sample Tests

To run the sample test suite:
`cucumber -p [server_name] [desired_tags]`

For example:

* `cucumber` to run all tests on the default server
* `cucumber -p staging` to run tests on the Staging server
* `cucumber -t @amaysim` to run tests tagged as @amaysim

Existing Tags in the test suite:

* `-t @call_forward` to test the update call forwarding setting
* `-t @sms_limit` to test the update premium SMS limit setting
* `-t @caller_id` to test the update caller ID setting


Author: **Jason B. Ogayon (Software Tester)**