# Robotron

Dynamic robots.txt for different Rails environments with Rack.

## Getting started

Add gem to your Gemfile

```ruby
gem 'robotron'
```

Bundle it

```shell
bundle install
```

Add to your **config/routes.rb**

```ruby
Rails.application.routes.draw do
  get '/robots.txt' => Robotron
end
```

Create **config/robots.txt** for production
