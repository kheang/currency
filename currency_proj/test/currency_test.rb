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

  def test_two_currency_objects_equal_each_other
    currency1 = Currency.new(3,"USD")
    currency2 = Currency.new(3,"USD")

    assert_equal currency1.num, currency2.num
    assert_equal currency1.code, currency2.code
  end

  def test_add_two_currency_objects_with_same_code
    currency1 = Currency.new(4,"USD")
    currency2 = Currency.new(8,"USD")
    currency_test_sum = currency1 + currency2

    assert_equal Currency.new(12,"USD"), currency_test_sum
  end

end
