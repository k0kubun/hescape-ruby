require_relative '../lib/hescape'

RSpec.describe Hescape do
  def escape_html(value)
    Hescape.escape_html(value)
  end

  describe '.escape_html' do
    it 'raises ArgumentError given nil' do
      expect { escape_html(nil) }.to raise_error(TypeError, /expected String/)
    end

    it 'escapes special characters' do
      expect(escape_html(%[<a href="foo=1&bar=2" target='_blank'>#</a>]))
        .to eq('&lt;a href=&quot;foo=1&amp;bar=2&quot; target=&#39;_blank&#39;&gt;#&lt;/a&gt;')
    end

    it 'escapes double quotes properly on an edge case' do
      expect(escape_html(%[ ""               ])).to eq(%[ &quot;&quot;               ])
    end
  end
end
