
desc 'Pack a Gem'
task :gem do

  require 'find'
  require 'rubygems'

  Find.find('./') { |file|
    File.chmod( 0755, file )
  }

  puts `gem1.8 build ./rfortune.gemspec`

end

