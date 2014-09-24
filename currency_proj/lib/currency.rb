class Currency
  include Comparable
  attr_reader :num, :code

  def initialize(num,curr_code)
    @num = num
    @code = curr_code
  end

  def <=>(comparison)
    if @code == comparison.code
      @num <=> comparison.num
    end
  end

  def +(other_currency)
    if @code == other_currency.code
      currency_sum = Currency.new(@num+other_currency.num,@code)
    else
      raise DifferentCurrencyCodeError
    end
  end

  def -(other_currency)
    if @code == other_currency.code
      currency_diff = Currency.new(@num-other_currency.num,@code)
    else
      raise DifferentCurrencyCodeError
    end
  end

  def *(multiplier)
      currency_product = Currency.new(@num*multiplier,@code)
  end

  def run
  end
end


class DifferentCurrencyCodeError < RuntimeError
end
