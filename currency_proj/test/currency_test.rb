require "minitest/autorun"
require "currency"

class CurrencyTest < MiniTest::Unit::TestCase
  def test_currency_has_amount
    currency = Currency.new(2,:USD)
    assert_equal 2, currency.num
  end

  def test_currency_has_currency_code
    currency = Currency.new(1,:USD)
    assert_equal :USD, currency.code
  end

  def test_two_currency_objects_equal_each_other
    currency1 = Currency.new(3,:USD)
    currency2 = Currency.new(3,:USD)

    assert_equal currency1.num, currency2.num
    assert_equal currency1.code, currency2.code
  end

  def test_add_two_currency_objects_with_same_code
    currency1 = Currency.new(4,:USD)
    currency2 = Currency.new(8,:USD)
    currency_test_sum = currency1 + currency2

    assert_equal Currency.new(12,:USD), currency_test_sum
  end

  def test_subtract_two_currency_objects_with_diff_code
    currency1 = Currency.new(7,:USD)
    currency2 = Currency.new(2,:USD)
    currency_test_diff = currency1 - currency2

    assert_equal Currency.new(5,:USD), currency_test_diff
  end

  def test_special_error_if_add_or_subtract_with_diff_codes
    currency1 = Currency.new(4,:USD)
    currency2 = Currency.new(8,:EUR)

    begin
      currency1 + currency2
    rescue DifferentCurrencyCodeError => ex
      result = :exception_add_handled
    end

    assert_equal :exception_add_handled, result

    begin
      currency1 - currency2
    rescue DifferentCurrencyCodeError => ex
      result = :exception_subtract_handled
    end

    assert_equal :exception_subtract_handled, result
  end

  def test_allow_multiplier_of_currency_object
    currency1 = Currency.new(5,:USD)
    currency1 *= 6

    assert_equal Currency.new(30,:USD), currency1

    currency2 = Currency.new(4.33,:USD)
    currency2 *= 1.5

    assert_equal Currency.new(6.495,:USD), currency2
  end

  def test_accept_one_value_and_find_curr_code
    currency = Currency.new("$5.00")

    assert_equal Currency.new(5,:USD), currency

    currency = Currency.new("€7.00")

    assert_equal Currency.new(7,:EUR), currency
  end
end
