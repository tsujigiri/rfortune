require 'test/unit'
require 'lib/cookiejar'

Cookie_jar_file = 'food'

class CookieJarTest < Test::Unit::TestCase

  def test_init
    
    assert_not_nil CookieJar.new( Cookie_jar_file ), 'Instantiated a new CookieJar'
  end

  def test_random
    assert_instance_of String, CookieJar.new( Cookie_jar_file ).random, 'Got a random cookie from the jar'
  end

  def test_count
    assert_instance_of Fixnum, CookieJar.new( Cookie_jar_file ).count
  end
end

