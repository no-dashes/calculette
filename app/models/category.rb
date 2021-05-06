class Category < ApplicationRecord

  has_many :calculations

  # belongs_to :parent_category, class_name: 'Category',
  #   inverse_of: :child_categories
  # has_many   :child_categories, class_name: 'Category',
  #   foreign_key: 'parent_category_id',
  #   inverse_of: :parent_category

  # ...and add a column parent_category_id

  validates :title, presence: true, uniqueness: true

end
