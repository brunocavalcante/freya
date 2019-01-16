Gem::Specification.new do |s|
  s.name         = 'freya'
  s.version      = '0.0.21'
  s.platform     = Gem::Platform::RUBY
  s.date         = '2018-12-26'
  s.summary      = 'A Simple Design System with a lot of tools for Rails Apps'
  s.description  = 'CSS/JS and Ruby Helpers to provide a lot of UI components for your web apps.'
  s.author       = 'Bruno Cavalcante'
  s.email        = 'brunofcavalcante@gmail.com'
  s.homepage     = 'http://rubygems.org/gems/freya'
  s.license      = 'MIT'
  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_path = 'lib'
  s.add_dependency 'simple_form', '~> 4.0'
end
