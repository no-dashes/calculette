class AddCategoryIdToCalcualtions < ActiveRecord::Migration[6.1]
  def change
    add_column :calculations, :category_id, :integer
  end
end
