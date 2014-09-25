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

end
