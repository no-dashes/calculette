require "test_helper"

class CategoryTest < ActiveSupport::TestCase

  test "title presence" do
    c = Category.new
    assert_not c.valid?
    c.title = '   '
    assert_not c.valid?
    c.title = 'Category Title FTW'
    assert c.valid?
    assert c.save
  end

  test "title uniqueness" do
    c = Category.create(title: 'cat')
    assert c.persisted?
    c2 = Category.create(title: 'cat')
    assert c2.new_record?
    c3 = Category.create(title: 'dog')
    assert c3.persisted?
    assert c3.id
    assert_not c2.id
  end

  test "calculations relation" do
    c = Category.create(title: 'cat')
    assert_equal 0, c.calculations.count
    c.calculations.create(
      argument1: 1,
      argument2: 2,
      operand:  '+'
    )
    c.reload
    assert_equal 1, c.calculations.count
  end

  test "using fixtures" do
    c1 = categories(:cat1)
    c2 = categories(:cat2)
    assert_equal "Category 1", c1.title
  end
end
