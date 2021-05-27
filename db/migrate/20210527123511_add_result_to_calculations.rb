class AddResultToCalculations < ActiveRecord::Migration[6.1]
  def change
    add_column :calculations, :result, :integer
  end
end
