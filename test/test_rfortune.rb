require 'test/unit'
require 'lib/rfortune'

Cookie_jar_file = 'food'

class RFortuneTest < Test::Unit::TestCase

  def test_init
    assert_not_nil RFortune.new( Cookie_jar_file ), 'Instantiated a new RFortune'
  end

  def test_random
    assert_instance_of String, RFortune.new( Cookie_jar_file ).random, 'Got a random cookie from the jar'
  end

  def test_count
    assert_instance_of Fixnum, RFortune.new( Cookie_jar_file ).count
  end

  def test_add_cookie_and_save

    cookies = RFortune.new( 'tmp_test_new_cookie_jar' )

    cookies.add( 'Simsalabimbambasaladusaladim' )

    cookies.save

    jar_file_content = ''

    if File.exist?( 'tmp_test_new_cookie_jar' )

      jar_file_content = File.open( 'tmp_test_new_cookie_jar', 'r' ).read

      File.delete( 'tmp_test_new_cookie_jar' )

    end

    assert_equal "%\nSimsalabimbambasaladusaladim\n%\n", jar_file_content, 'Check if the cookie jar file has been written'
  end

  def test_init_without_argument_and_save

    cookies = RFortune.new

    assert_not_nil cookies, 'Instantiate RFortune without specifying a file'

    assert_raise RuntimeError do

      cookies.save

    end 

    assert_nothing_raised do

      cookies.save 'tmp_test_cookie_jar'

    end

    File.exist?( 'tmp_test_cookie_jar' ) and File.delete( 'tmp_test_cookie_jar' )

  end

end
