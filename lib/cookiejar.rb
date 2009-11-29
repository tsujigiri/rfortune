# This library provides handling of cookie jar files as used by
# 'fortune' to read its fortunes from.
#
# Author::	Helge Rausch (mailto:helge@rauschenimweltnetz.de)
# Copyright::	Copyright (c) 2009 Helge Rausch
# License::	Distributes under the same terms as Ruby

# The CookieJar class reads the contents from a cookie jar file and
# stores its content in an array. It takes the path of a cookie jar file
# as an argument and searches for it first locally (relative or
# absolute), than beneath /usr/share/games/fortunes.

class CookieJar

  FortunesPath = '/usr/share/games/fortunes/'

  # Looks for the specified cookie jar file first localy, than under
  # /usr/share/games/fortunes, opens it and reads its content to the
  # @cookies array
  def initialize file_path = nil

    @file_path = file_path

    unless @file_path.nil?

      if File.exist?( @file_path )

	if File.writable?( @file_path )
	  mode = 'r+'
	else
	  mode = 'r'
	end

	cookie_jar_file =  File.open( @file_path, mode )

      elsif File.exist?( FortunesPath + @file_path )

	cookie_jar_file =  File.open( FortunesPath + @file_path, 'r' )

      elsif File.exist?( FortunesPath + 'off/' + @file_path )

	cookie_jar_file =  File.open( FortunesPath + 'off/' + @file_path, 'r' )

      end

    end

    unless  cookie_jar_file.nil?

      @cookies = cookie_jar_file.read.split( '%' )

      cookie_jar_file.close

      # delete empty cookies
      @cookies.delete_if { |cookie| cookie.match( /^[\r\n\s]+$/ ) }

    else

      @cookies = []

    end

  end


  # Returns a random cookie
  def random

    @cookies[ rand( @cookies.size ) ]

  end


  # returns the number of cookies in the jar
  def count

    @cookies.size

  end

  # add cookie to cookie jar
  def add cookie

    @cookies += [ cookie ] unless cookie.empty?

  end

  # returns all cookies in an array
  def all

    @cookies

  end

  # returns all cookies in cookie jar file format
  def all_formated

    all_cookies = @cookies.collect { |c| c = "\n%\n" + c }

    all_cookies += [ "\n%\n" ]

    all_cookies.to_s.sub( /^\n+/, '' )

  end

  # saves the content of the jar to the file specified by argument to
  # given itself or to new
  def save new_file_path = nil

    new_file_path or new_file_path = @file_path or raise 'No file name given'

    File.open( new_file_path, 'w') { |jar| jar.puts all_formated }

  end

end
