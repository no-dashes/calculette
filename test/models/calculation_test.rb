require "test_helper"

class CalculationTest < ActiveSupport::TestCase

  test "table exists" do
    Calculation.count
  end

  test 'check + calculation' do
    calc = Calculation.new(
      argument1: 1,
      argument2: 2,
      operand:  '+'
    )
    assert_equal 3, calc.result
  end

  test 'check - calculation' do
    calc = Calculation.new(
      argument1: 1,
      argument2: 2,
      operand:  '-'
    )
    assert_equal -1, calc.result
  end

  test "using fixtures" do
    c = calculations(:addition)
    assert 3, c.result
  end

end
