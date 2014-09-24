require "minitest/autorun"
require "currency_converter"

class CurrencyConverterTest < MiniTest::Unit::TestCase

  def test_currency_converter_has_values
    curr_converter = CurrencyConverter.new
    codes = {:USD=>1.0,:EUR=>0.74}

    assert_equal codes, curr_converter.codes
  end

  

end
