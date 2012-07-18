# -*- encoding: utf-8 -*-
require File.expand_path('../lib/nokogiri-styles/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Sijmen Mulder']
  gem.email         = ['sijmen@readmo.re']
  gem.summary       = %q{Basic inline CSS reading and editing for Nokogiri}
  gem.homepage      = ''

  gem.description   = <<-EOF
    NokgiriStyles lets you decompose inline CSS styling (the style attribute) in
    HTML elements so you don’t have to bother with regexes and such.

    Usage:
    
        require 'nokogiri'
        require 'nokogiri-styles'

        # ...
    
        # Get styles
        node['style']         # => 'width: 400px; color: blue'
        node.styles['width']  # => '400px'
        node.styles['color']  # => 'blue'
    
        # Update styles
        style = node.styles
        style['width']  = '500px'
        style['height'] = '300px'
        style['color']  = nil
        node.styles = style
        node['style']         # => 'width: 500xp; height: 300px'

        # Modify classes
        node['class']         # => 'foo bar'
        node.classes          # => ['foo', 'bar']
        node.classes = ['foo']
        node['class']         # => 'foo'

    Note that the `style` attribute is only updated when assigning `.styles`,
    simply doing `node.styles['color'] = 'red'` does not work. Patches welcome.
  EOF

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'nokogiri-styles'
  gem.require_paths = ['lib']
  gem.version       = NokogiriStyles::VERSION

  gem.add_dependency('nokogiri')
  gem.add_development_dependency('test-unit', '2.4.8')
end
