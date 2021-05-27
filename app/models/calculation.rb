class Calculation < ApplicationRecord
  OPERANDS = ['+', '-', '*', '/']

  belongs_to :category

  validates :argument1, :argument2, :operand,
    presence: true
  validates :operand, inclusion: {in: OPERANDS}
  after_save :compute_result_async
  
  before_save do
    self.result = nil
  end

  def frontend_title
    title.presence || "#{argument1} #{operand} #{argument2}"
  end

  def compute_result_async
    self.delay(run_at: 3.minutes.from_now).compute_result
  end

  def compute_result
    # return if result.present?
    sleep(rand(1..8))
    case operand
    when '+' then update_columns result: (argument1 + argument2)
    when '-' then update_columns result: (argument1 - argument2)
    when '*' then update_columns result: (argument1 * argument2)
    when '/' then update_columns result: (argument1 / argument2)
    else "dunno!"
    end
  end

end
