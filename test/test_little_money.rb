require "test/unit"
require "little_money"

class TestLittleMoney < MiniTest::Unit::TestCase
  def test_should_parse_a_string_into_money
    money = LittleMoney.parse("1.25")
    assert_equal LittleMoney, money.class
  end

  def test_should_parse_a_string_into_an_amount
    money = LittleMoney.parse("1.25")
    assert_equal 125, money.amount
  end

  def test_should_report_the_precision
    money = LittleMoney.parse("1.25")
    assert_equal 2, money.precision
  end

  def test_should_have_a_minimum_precison_of_two
    money = LittleMoney.parse("1")
    assert_equal 2, money.precision
    assert_equal 100, money.amount
  end

  def test_should_handle_fractional_cents
    money = LittleMoney.parse("0.0125")
    assert_equal 125, money.amount
    assert_equal 4, money.precision
  end

  def test_should_have_nice_to_s
    money = LittleMoney.parse("100.2504")
    assert_equal "<LittleMoney amount=1002504 precision=4 >", money.to_s
  end

  def test_should_have_dollar_formatted_string
    money = LittleMoney.parse("1.25")
    assert_equal "$1.25", money.to_s(:dollar)
  end

  def test_should_have_dollar_formatted_string_for_precision_greater_than_2
    money = LittleMoney.parse("1.0125")
    assert_equal "$1.0125", money.to_s(:dollar)
  end

  def test_should_add_correctly_with_same_precision
    money = LittleMoney.parse("1.0125")
    other = LittleMoney.parse("1.0125")
    sum = money + other
    assert_equal 20250, sum.amount
  end

  def test_should_allow_an_amount_to_be_extended_to_a_greater_precision
    money = LittleMoney.parse("1.03")
    money.extend_precision(4)
    assert_equal 10300, money.amount
    assert_equal 4, money.precision
  end

  def test_should_add_different_precisions
    money = LittleMoney.parse("1.25")
    other = LittleMoney.parse("0.0036")
    sum = money + other
    assert_equal 12536, sum.amount
  end

  def test_should_multiply_different_precisions
    money = LittleMoney.parse("1.25")
    other = LittleMoney.parse("1.0025")
    product = money * other
    assert_equal 125312500, product.amount
    assert_equal 8, product.precision
  end

  def test_should_divide_different_precisions
    money = LittleMoney.parse("1.25")
    other = LittleMoney.parse("0.0025")
    result = money / other
    assert_equal 50000, result.amount
    assert_equal 2, result.precision

    money = LittleMoney.parse("12.10")
    other = LittleMoney.parse("0.05")
    result = money / other
    assert_equal 24200, result.amount
    assert_equal 2, result.precision

    money = LittleMoney.parse("0.01")
    other = LittleMoney.parse("10")
    result = money / other
    assert_equal 1, result.amount
    assert_equal 3, result.precision
  end

  def test_should_round_when_decimal_below_five_hundred
    money = LittleMoney.parse("4.049")
    assert_equal "$4.10", money.round(1).to_s(:dollar)
    assert_equal "$4.05", money.round(2).to_s(:dollar)
  end

  def test_should_round_dollar_amount_when_decimal_rounds_up
    money = LittleMoney.parse("4.999")
    assert_equal "$5.00", money.round(2).to_s(:dollar)
    money = LittleMoney.parse("99.99")
    assert_equal "$100.00", money.round(1).to_s(:dollar)
  end

end
