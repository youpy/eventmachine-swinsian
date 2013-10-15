# eventmachine-swinsian

An [EventMachine](http://wiki.github.com/eventmachine/eventmachine/) extension to watch [Swinsian](http://swinsian.com/) play/pause/stop

## Installation

Add this line to your application's Gemfile:

    gem 'eventmachine-swinsian'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install eventmachine-swinsian

## Usage

```ruby
module Watcher
  def on_play(info)
    puts 'now playing %s' % [info['artist'], info['title']].join(' - ')
  end
end

EM.run {
  EM.watch_swinsian(Watcher)
}
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## See also

- http://swinsian.com/support/developers.html
