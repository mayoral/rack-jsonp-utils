[![Gem Version](https://badge.fury.io/rb/rack-jsonp-utils.svg)](http://badge.fury.io/rb/rack-jsonp-utils)
[![Code Climate](https://codeclimate.com/github/mayoral/rack-jsonp-utils/badges/gpa.svg)](https://codeclimate.com/github/mayoral/rack-jsonp-utils)
[![Inline docs](http://inch-ci.org/github/mayoral/rack-jsonp-utils.svg?branch=master)](http://inch-ci.org/github/mayoral/rack-jsonp-utils)
[![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/mayoral/rack-jsonp-utils?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

# Rack::JSONP::Utils

Some Rack middlewares to make easier for your app to support JSONP.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rack-jsonp-utils'
```

And then execute:

    $ bundle

## Usage

Simply add these lines to your `config/application.rb` file:

```ruby
config.middleware.use Rack::JSONP::Callback
config.middleware.use Rack::JSONP::MethodOverride
```

### Rack::JSONP::Callback

This middleware will transform your JSON output into a valid JSONP output, using the callback name specified in the URL.

By default, this middleware will use `callback` as the callback parameter in the query string. You can customize the name for the callback parameter:  

```ruby
config.middleware.use Rack::JSONP::Callback, 'my_callback_param'
```

### Rack::JSONP::MethodOverride

This middleware will help you to transform internally the request to the HTTP method you want, since all the requests in JSONP must be GET requests. It will also force the HTTP response code of your request to be 200.

As an example, `http://example.com/customers&callback=myfunc&_method=POST` will be seen by your app as a `POST /customers` request.

By default, this middleware will use `callback` as the callback parameter in the query string, and `_method`. It will not activate if these two params are not in the query string.
 
You can customize the name of these params:  

```ruby
# To only change the method override param name
config.middleware.use Rack::JSONP::MethodOverride, 'my_method_override_param'

# To also change the callback param name
config.middleware.use Rack::JSONP::MethodOverride, 'my_method_override_param', 'my_callback_param'
```

## Contributing

1. Fork it ( https://github.com/mayoral/rack-jsonp-utils/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
