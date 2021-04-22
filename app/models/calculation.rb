class Calculation < ApplicationRecord
  OPERANDS = ['+', '-', '*', '/']

  validates :argument1, :argument2, :operand,
    presence: true
  validates :operand, inclusion: {in: OPERANDS}

  def result
    case operand
    when '+' then argument1 + argument2
    when '-' then argument1 - argument2
    when '*' then argument1 * argument2
    when '/' then argument1 / argument2
    else "dunno!"
    end
  end

end
