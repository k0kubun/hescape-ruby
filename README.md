# hescape-ruby [![wercker status](https://app.wercker.com/status/c75c229e77ca1a27a7e70189b6d7aed8/s/master "wercker status")](https://app.wercker.com/project/byKey/c75c229e77ca1a27a7e70189b6d7aed8)

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
