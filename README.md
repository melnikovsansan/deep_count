# DeepCount

Convert result of count by multiple group to nested hash.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'deep_count'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install deep_count

## Usage

Default ActiveRecord behavior:

```ruby
User.group(:sex, :role).count #=> {["female", "admin"]=>1, ["male", "admin"]=>1, ["male", "user"]=>3} 
```

Own solution: 

```ruby
User.group(:sex, :role).deep_count #=> {"female"=>{"admin"=>1}, "male"=>{"admin"=>1, "user"=>3}} 
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/deep_count. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

