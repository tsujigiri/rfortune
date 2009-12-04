Gem::Specification.new do |s|
  s.name = 'rfortune'
  s.version = '0.1.2'
  s.date = '2009-11-30'
  s.authors = ['Helge Rausch']
  s.email = 'helge@rauschenimweltnetz.de'
  s.summary = 'RFortune provides handling of cookie jar files as known from \'fortune\''
  s.homepage = 'http://github.com/tsujigiri/rfortune'
  s.description = 'RFortune provides handling of cookie jar files as known from \'fortune\''
  s.has_rdoc = true
  s.extra_rdoc_files = [ 'README.rdoc', 'TODO.rdoc' ]
  s.test_files = Dir.glob('test/test_*.rb')
  s.files = [
    'lib/rfortune.rb',
    'test/test_rfortune.rb',
    'LICENSE',
    'README.rdoc',
    'TODO.rdoc',
    'VERSION' ]

end
