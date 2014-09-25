class Currency
  include Comparable
  attr_reader :num, :code

  def initialize(num,curr_code = nil)
    symbol_code_pair = {"$"=>:USD,"€"=>:EUR,"£"=>:GBP}

    if curr_code != nil
      @num = num
      @code = curr_code
    else
      symbol_code_pair.each do |key, value|
        symbol = key.encode("UTF-8")
        if /#{symbol}/.match(num)
          @code = symbol_code_pair[symbol]
          @num = (num.delete key).to_i
        end
      end
    end
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
