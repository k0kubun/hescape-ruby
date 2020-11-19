# hescape-ruby

A gem to use [hescape](https://github.com/k0kubun/hescape) from Ruby, which is fast HTML escape implementation using SSE instructions.

## Benchmark

See [the result](https://app.wercker.com/k0kubun/hescape-ruby/runs/build/57b09e1de8960a01001b3811) of [this benchmark](https://github.com/k0kubun/hescape-ruby/blob/v0.1.0/benchmark/benchmark.rb). Followings are the result of:

```ruby
Benchmark.ips do |x|
  str = ENV['ESCAPE_STRING']
  puts "escaping: #{str}"

  escape_table = { "'" => '&#39;', '&' => '&amp;', '"' => '&quot;', '<' => '&lt;', '>' => '&gt;', }

  x.report('gsub')         { str.gsub(/['&\"<>]/, escape_table) }
  x.report('escape_utils') { EscapeUtils.escape_html(str, false) }
  x.report('cgi/escape')   { CGI.escapeHTML(str) }
  x.report('hescape')      { Hescape.escape_html(str) }
  x.compare!
end
```

### No escape
```
escaping: https://github.com/k0kubun/hescape-ruby
Calculating -------------------------------------
                gsub      2.392M (± 1.0%) i/s -     11.983M in   5.010225s
        escape_utils      2.365M (± 0.3%) i/s -     11.896M in   5.031031s
          cgi/escape      3.787M (± 8.0%) i/s -     18.965M in   5.037529s
             hescape      7.515M (± 0.3%) i/s -     37.736M in   5.021293s

Comparison:
             hescape:  7515215.8 i/s
          cgi/escape:  3787425.3 i/s - 1.98x  slower
                gsub:  2391950.1 i/s - 3.14x  slower
        escape_utils:  2364604.2 i/s - 3.18x  slower
```

### Short escape
Note: If given string is short, hescape skips SSE instruction. But it's fast.

```
escaping: <script />
Calculating -------------------------------------
                gsub    586.604k (± 1.8%) i/s -      2.941M in   5.015840s
        escape_utils      2.948M (± 0.3%) i/s -     14.781M in   5.014237s
          cgi/escape      2.646M (± 1.7%) i/s -     13.226M in   5.000218s
             hescape      3.731M (± 0.3%) i/s -     18.661M in   5.001429s

Comparison:
             hescape:  3731246.4 i/s
        escape_utils:  2947868.9 i/s - 1.27x  slower
          cgi/escape:  2645937.6 i/s - 1.41x  slower
                gsub:   586604.3 i/s - 6.36x  slower
```

### Long escape

```
escaping: <<<<<<<<<<>>>>>>>>>&&&&&&&&&&""""""'''''
Calculating -------------------------------------
                gsub     66.181k (± 0.4%) i/s -    331.968k in   5.016150s
        escape_utils    749.600k (± 8.1%) i/s -      3.762M in   5.053210s
          cgi/escape    720.474k (± 1.6%) i/s -      3.628M in   5.037395s
             hescape    754.412k (± 8.2%) i/s -      3.801M in   5.070904s

Comparison:
             hescape:   754411.6 i/s
        escape_utils:   749600.4 i/s - same-ish: difference falls within error
          cgi/escape:   720473.5 i/s - same-ish: difference falls within error
                gsub:    66181.0 i/s - 11.40x  slower
```

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
