require "minitest/autorun"
require "currency"

class CurrencyProjTest < MiniTest::Unit::TestCase
  def test_first_test
    currency = Currency.new(2)
    assert_equal 2, currency.num
  end
end
