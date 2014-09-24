require "minitest/autorun"
require "currency"

class CurrencyProjTest < MiniTest::Unit::TestCase
  def test_currency_has_amount
    currency = Currency.new(2,"USD")
    assert_equal 2, currency.num
  end

  def test_currency_has_currency_code
    currency = Currency.new(1,"USD")
    assert_equal "USD", currency.code
  end

  def test_two_objects_equal_each_other
    currency1 = Currency.new(1,"USD")
    currency2 = Currency.new(1,"USD")

    assert_equal currency1.num, currency2.num
    assert_equal currency1.code, currency2.code
  end

end
