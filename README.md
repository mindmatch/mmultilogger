# Mmultilogger [![Build Status](https://travis-ci.org/mindmatch/mmultilogger.svg?branch=master)](https://travis-ci.org/mindmatch/mmultilogger)

Logger proxy that allows to log to multple loggers at the same time

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mmultilogger'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mmultilogger

## Usage

Enables you to log to to different places with different configuration as long as the loggers impplement the same interface.

example:

    # Configuring different log levels for rollbar and stdout

    require 'logger'
    require 'rollbar/logger'
    require 'mmultilogger'

    Rollbar.configure do |config|
      config.access_token = ENV['ROLLBAR_TOKEN']
    end

    logger = Logger.new($stdout).tap{|l| l.level = 0}
    rollbar = Rollbar::Logger.new

    mlogger = Mmultilogger.new(logger, rollbar)

    mlogger.debug("Hello World!")
    # => D, [2017-09-08T17:25:20.577052 #90346]  DEBUG -- : Hello World!


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mindmatch/mmultilogger. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Mmultilogger project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/mindmatch/mmultilogger/blob/master/CODE_OF_CONDUCT.md).
