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

  def +(comparison)
    if @code == comparison.code
      currency_sum = Currency.new(@num+comparison.num,@code)
    end
  end

  def -(comparison)
    if @code == comparison.code
      currency_sum = Currency.new(@num-comparison.num,@code)
    end
  end

  def run

  end
  # 
  # def DifferentCurrencyCodeError < StandardError
  # end
end
