class LittleMoney
  VERSION = '0.0.1'

  attr_accessor :amount, :precision, :whole, :cents

  # Create a new object from a string or number.
  def self.parse(money_string_or_number)
    cleaned = money_string_or_number.to_s.gsub(/[^0-9.]/, '')
    dollars, cents = cleaned.split(".")
    cents ||= ""
    # strip trailing zeros
    cents.gsub!(/0+$/, '')
    cents << "0" * (2 - cents.length) unless cents.length > 1
    new([dollars, cents].join("").to_i, cents.length)
  end

  def initialize(amount, precision = 0)
    @amount = amount
    @precision = precision
    amount_string = amount.to_s
    @whole = amount_string[0...(amount_string.length - precision)]
    @cents = amount_string[-precision..-1]
  end

  def to_s(format = nil)
    case format
    when NilClass
    "<LittleMoney amount=#{amount} precision=#{precision} >"
    when :dollar
      "$#{@whole}.#{@cents}"
    end
  end

  def round(places)
    if precision > places
      keep = @cents
      while keep.length > places
        keep, discard = keep[0..-2], keep[-1].to_i
        if discard > 4
          keep_length = keep.length
          keep = (keep.to_i + 1).to_s
          if keep.length > keep_length
            whole_adjusted = @whole.to_i + 1
            return self.class.parse("#{whole_adjusted}.#{keep[1..precision]}")  
          elsif keep.length < keep_length
            keep = "0" * (keep_length - keep.length) << keep
          end
        end
      end 
      return self.class.parse("#{@whole}.#{keep}")
    end
    return self
  end

  def extend_precision(prec)
    diff = prec - self.precision
    self.amount *= (10 ** diff)
    self.precision += diff
    @cents << "0" * diff
  end

  def +(other)
    adjust_precision(self, other)
    self.class.new(self.amount + other.amount, precision)
  end

  def *(other)
    adjust_precision(self, other)
    self.class.new(self.amount * other.amount, precision * 2)
  end

  def /(other)
    adjust_precision(self, other)
    self.class.parse("%0.4f" % (self.amount / (other.amount * 1.0)))
  end

  private
  def adjust_precision(first, second)
    return if first.precision == second.precision
    if(first.precision < second.precision)
      first.extend_precision(second.precision)
    elsif(second.precision < first.precision)
      second.extend_precision(first.precision)
    end
  end
end
