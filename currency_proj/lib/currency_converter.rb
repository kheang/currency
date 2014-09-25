class CurrencyConverter
  attr_reader :codes

  def initialize
    @codes = {:USD=>1.0,:EUR=>0.74}
  end

  def convert(currency,code)
    Currency.new(currency.num,code)
  end

  def run
  end
end
