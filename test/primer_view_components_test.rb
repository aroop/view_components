require "test_helper"

class Primer::ViewComponentsTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Primer::ViewComponents::VERSION::STRING
  end
end
