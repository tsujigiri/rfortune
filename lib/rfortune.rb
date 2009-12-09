# This library provides handling of cookie jar files as used by
# 'fortune' to read its fortunes from.
#
# Author::	Helge Rausch (mailto:helge@rauschenimweltnetz.de)
# Copyright::	Copyright (c) 2009 Helge Rausch
# License::	Distributes under the same terms as Ruby

# The RFortune class reads the contents from a cookie jar file and
# stores its content in an array. It takes the path of a cookie jar file
# as an argument and searches for it first locally (relative or
# absolute), than beneath /usr/share/games/fortunes.

class RFortune

  # The path to fortune's fortunes directory
  FORTUNES_PATH = '/usr/share/games/fortunes/'

  # Looks for the specified cookie jar file first localy, than under
  # /usr/share/games/fortunes, opens it and reads its content to the
  # @cookies array. Without an argument or if the file specified does
  # not exist it creates a new cookie jar.
  def initialize file_path = nil

    @file_path = file_path

    unless @file_path.nil?

      if File.exist?( @file_path )

	cookie_jar_file =  File.open( @file_path, 'r' )

      elsif File.exist?( FORTUNES_PATH + @file_path )

	cookie_jar_file =  File.open( FORTUNES_PATH + @file_path, 'r' )

      elsif File.exist?( FORTUNES_PATH + 'off/' + @file_path )

	cookie_jar_file =  File.open( FORTUNES_PATH + 'off/' + @file_path, 'r' )

      end

    end

    # If there is a cookie jar file, read it. Otherwise start with an empty one.
    unless  cookie_jar_file.nil?

      @cookies = cookie_jar_file.read.split( '%' )

      cookie_jar_file.close

      # Delete empty cookies
      @cookies.delete_if { |cookie| cookie.match( /\A[\r\n\s]*\Z/ ) }

    else

      @cookies = []

    end

    self

  end


  # Returns a random cookie
  def random

    @cookies[ rand( @cookies.size ) ]

  end


  # Returns the number of cookies in the jar
  def count

    @cookies.size

  end

  # Adds one or more cookies to the jar. Takes a String, Array or RFortune as an argument.
  def add cookies
    @cookies += case cookies.class.to_s
		when 'String' then cookies.split('%')
		when 'Array' then cookies
		when 'RFortune' then cookies.to_a
		else raise TypeError, 'Argument has to be of type String, Array or RFortune, but was of type ' + cookies.class.to_s
		end

    self

  end


  # Summation, takes String, Array or RFortune
  def + cookies

    RFortune.new.add( @cookies ).add( cookies )

  end


  # Returns all cookies in an Array
  def to_a

    @cookies

  end


  # Depricated, alias for to_a
  def all

    to_a

  end


  # Returns all cookies in cookie jar file format
  def formated

    cookies = @cookies.collect { |c| c = "\n%\n" + c }

    cookies += [ "\n%\n" ]

    cookies.to_s.sub( /^\n+/, '' )

  end


  # Depricated, alias for formated
  def all_formated
    formated
  end


  # Saves the content of the jar to the file specified by argument given
  # to itself or to the initialize method
  def save new_file_path = nil

    # If there is no new_file_path specified take the path specified
    # at initialization. If thats also not specified raise an error.
    new_file_path or new_file_path = @file_path or raise 'No file name given'

    # Write all cookies in cookie jar format to the file specified
    File.open( new_file_path, 'w') { |jar| jar.puts all_formated }

  end

  # Calls block once for each cookie, passing that cookie as a parameter. 
  def each

    @cookies.each { |c| yield c }

  end

  # Returns a random fortune from fortune's fortunes. If a block is
  # given it passes one fortune per iteration to the block. Infinite.
  # That means FOREVER! So be careful!
  # Takes 'true' as an argument if you'd like to include offensive
  # fortunes.
  def self.random_fortune( no_offense = true )

    cookie_jars = []

    Dir.foreach( FORTUNES_PATH ) { |filename|

      cookie_jars += [ filename ] if filename.match( /\A.*\.u8\Z/ )

    }

    unless no_offense

      Dir.foreach( FORTUNES_PATH + 'off/' ) { |filename|

	cookie_jars += [ 'off/' + filename ] if filename.match( /\.u8\Z/ )

      }

    end

    if block_given?

      fortunes = RFortune.new

      cookie_jars.each { |jar|

	fortunes += RFortune.new( jar )

      }

      begin

	yield fortunes.random

      end while true

    else 

      RFortune.new( FORTUNES_PATH + cookie_jars[ rand( cookie_jars.size ) ] ).random

    end

  end

end

