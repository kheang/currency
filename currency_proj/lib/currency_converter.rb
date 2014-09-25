class CurrencyConverter
  attr_reader :codes

  def initialize(codes = {})
    @codes = codes
    if @codes == {}
      @codes = {:USD=>1.0,:EUR=>0.74}
    end
  end

  def convert(currency,code)
    if @codes[currency.code] != nil && @codes[code] != nil
      converted_amount = currency.num*(@codes[code]/@codes[currency.code])
      Currency.new(converted_amount,code)
    else
      raise UnknownCurrencyCodeError
    end

  end

  def run
  end
end

class UnknownCurrencyCodeError < RuntimeError
end
