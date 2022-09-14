require 'benchmark/ips'
require 'hescape'
require 'cgi/escape' # Require Ruby 2.3+

Benchmark.ips do |x|
  str = ENV['ESCAPE_STRING'] || "https://github.com/k0kubun/hescape-ruby"
  puts "escaping: #{str}"

  escape_table = {
    "'" => '&#39;',
    '&' => '&amp;',
    '"' => '&quot;',
    '<' => '&lt;',
    '>' => '&gt;',
  }

  x.report('gsub')         { str.gsub(/['&\"<>]/, escape_table) }
  x.report('cgi/escape')   { CGI.escapeHTML(str) }
  x.report('hescape')      { Hescape.escape_html(str) }
  x.compare!
end
