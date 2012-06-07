# encoding: UTF-8
version = File.read(File.expand_path("../GEM_VERSION",__FILE__)).strip

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_flexirate_extended'
  s.version     = version
  s.summary     = 'Improved flexirate shipping for Spree Commerce with more ranges'
  s.required_ruby_version = '>= 1.9.3'

  s.author            = 'Buddhi DeSilva'
  s.email             = 'buddhi@kill3rmedia.com'
  s.homepage          = 'http://github.com/buddhi-desilva/spree_flexirate_extended'
	# s.rubyforge_project = 'spree_flexirate_extended'

  s.files        = Dir['CHANGELOG', 'README.md', 'LICENSE', 'lib/**/*', 'app/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency('spree_core', '>= 1.0.0.rc2')
  s.add_development_dependency 'rspec-rails'
end
