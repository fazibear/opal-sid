# opal-sid [![Gem Version](https://badge.fury.io/rb/opal-sid.svg)](http://badge.fury.io/rb/opal-sid) [![Code Climate](https://codeclimate.com/github/fazibear/opal-sid/badges/gpa.svg)](https://codeclimate.com/github/fazibear/opal-sid)

Hermit [jsSID](https://github.com/hermitsoft/jsSID) wrapper for opal.

## usage

### Server side
config.ru, Rakefile, Rails, Sinatra, etc.

```ruby
require 'opal-sid'
```

Gemfile

```ruby
gem 'opal-sid'
```

### Browser side

```ruby
require 'sid'

current_song = {}
sid = SID.new
sid.on_load do |x|
  @current_song = {
    title: sid.title,
    author: sid.author,
    info: sid.info,
    tunes: sid.tunes
  }
end

sid.load_and_play("http://url", 0)

puts current_song
```
