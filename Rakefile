
require 'rake'
require 'rake/testtask'


desc 'Run tests'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/test_*.rb'
  t.verbose = true
end


desc 'Pack a Gem'
task :gem do

  require 'find'
  require 'rubygems'

  Find.find('./') { |file|
    File.chmod( 0755, file )
  }

  puts `gem1.8 build ./rfortune.gemspec`

end

