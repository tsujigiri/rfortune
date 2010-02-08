Gem::Specification.new do |s|
  s.name = 'rfortune'
  s.version = '0.3.0'
  s.date = '2010-02-08'
  s.authors = ['Helge Rausch']
  s.email = 'helge@rauschenimweltnetz.de'
  s.summary = 'RFortune provides handling of cookie jar files as known from \'fortune\''
  s.homepage = 'http://github.com/tsujigiri/rfortune'
  s.description = 'For further details consult the README file.'
  s.has_rdoc = true
  s.extra_rdoc_files = [ 'README.rdoc', 'CHANGELOG.rdoc' ]
  s.test_files = Dir.glob('test/test_*.rb')
  s.files = [
    'lib/rfortune.rb',
    'CHANGELOG.rdoc',
    'test/test_rfortune.rb',
    'LICENSE',
    'README.rdoc',
    'VERSION' ]

end
