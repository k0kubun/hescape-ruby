# hescape-ruby

A gem to use [hescape](https://github.com/k0kubun/hescape) from Ruby, which is fast HTML escape implementation using SSE instructions.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hescape'
```

## Usage

```ruby
Hescape.escape_html(%[<>"'&]) #=> "&lt;&gt;&quot;&#39;&amp;"
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
