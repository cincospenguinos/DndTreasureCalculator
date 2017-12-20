# DndTreasureCalc

A simple CLI to calculate treasure for Dungeons and Dragons 5e. I figured I could make a single tool that would do it for me,
and I'd never have to do it manually again.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dnd_treasure_calc'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dnd_treasure_calc

## Usage

Right now there is only one command to generate individual treasure, of the format `dnd_treasure_calc individual [challenge rating] [number of monsters]`. Examples below:

```bash
individual 6 1 # Treasure held by one monster with a challenge rating of 6
individual 2 5 # Treasure held by five different monsters with a challenge rating of 2
individual 2 5 --show_each # Treasure held by five different monsters with a challenge rating of 2, displayed individually
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cincospenguinos/dnd_treasure_calc.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

