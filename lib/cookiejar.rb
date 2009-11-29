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

  CookieJarPath = '/usr/share/games/fortunes/'

  # Looks for the specified cookie jar file first localy, than under
  # /usr/share/games/fortunes, opens it and reads its content to the
  # @cookies array
  def initialize file_path

    if File.exist?( file_path )

      cookie_jar_file =  File.open( file_path, 'r' )

    elsif File.exist?( CookieJarPath + file_path )

      cookie_jar_file =  File.open( CookieJarPath + file_path, 'r' )

    elsif File.exist?( CookieJarPath + 'off/' + file_path )

      cookie_jar_file =  File.open( CookieJarPath + 'off/' + file_path, 'r' )

    else

      warn 'cookie jar file "' + file_path + '" not found'

      return nil

    end

    @cookies = cookie_jar_file.read.split( '%' )

    cookie_jar_file.close

    # delete empty cookies
    @cookies.delete_if { |cookie| cookie.match( /^[\r\n\s]+$/ ) }

  end

  # Returns a random cookie
  def random

    @cookies[ rand( @cookies.size ) ]

  end

  # returns the number of cookies in the jar
  def count

    @cookies.size

  end


end

