require "minitest/autorun"
require "currency_converter"

class CurrencyConverterTest < MiniTest::Unit::TestCase

  def test_currency_converter_has_values
    curr_converter = CurrencyConverter.new
    codes = {:USD=>1.0,:EUR=>0.74}

    assert_equal codes, curr_converter.codes
  end

  def test_currency_converter_can_create_currency_obj_from_other_obj
    curr_converter = CurrencyConverter.new
    currency = Currency.new(3,:USD)
    converted_currency = curr_converter.convert(currency,:USD)

    assert_equal Currency.new(3,:USD), converted_currency
  end

  def test_return_converted_currency_object
    curr_converter = CurrencyConverter.new
    currency = Currency.new(25,:USD)
    converted_currency = curr_converter.convert(currency,:EUR)

    assert_equal Currency.new(25*0.74,:EUR), converted_currency
  end

  def test_create_curr_converter_with_hash_of_at_least_three_values
    curr_codes_hash = {:USD=>1.0,:EUR=>0.74,:GBP=>0.61}
    curr_converter = CurrencyConverter.new(curr_codes_hash)

    assert_equal curr_codes_hash, curr_converter.codes
  end

  def test_can_return_converted_currencies_for_all_codes
    curr_codes_hash = {:USD=>1.0,:EUR=>0.74,:GBP=>0.61}
    curr_converter = CurrencyConverter.new(curr_codes_hash)

    converted_curr_GBP_EUR = curr_converter.convert(Currency.new(50,:GBP),:EUR)
    converted_curr_USD_GBP = curr_converter.convert(Currency.new(25,:USD),:GBP)

    assert_equal Currency.new((50*0.74/0.61),:EUR),converted_curr_GBP_EUR
    assert_equal Currency.new((25*0.61/1.00),:GBP),converted_curr_USD_GBP
  end

  def test_error_if_unknown_currency_code
    curr_codes_hash = {:USD=>1.0,:EUR=>0.74,:GBP=>0.61}
    curr_converter = CurrencyConverter.new(curr_codes_hash)

    begin
      converted_curr_GBP_CAD = curr_converter.convert(Currency.new(50,:GBP),:CAD)
    rescue UnknownCurrencyCodeError => ex
      result = :exception_unknown_code_handled
    end

    assert_equal :exception_unknown_code_handled, result

    begin
      converted_curr_AUD_USD = curr_converter.convert(Currency.new(50,:AUD),:USD)
    rescue UnknownCurrencyCodeError => ex
      result = :exception_unknown_code_handled2
    end

    assert_equal :exception_unknown_code_handled2, result
  end
end
