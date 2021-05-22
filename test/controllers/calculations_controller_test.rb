require "test_helper"

class CalculationsControllerTest < ActionDispatch::IntegrationTest

  test "visit blank calculations page" do
    get calculations_path
    assert_response :success
    assert_raise do
      get calculation_path(99999999)
    end
  end

  test "new calculation not logged in!" do
    get new_calculation_path
    # assert_response :redirect
    # debugger
    assert @response.body['<form class="simple_form new_calculation" id="new_calculation" novalidate="novalidate" action="/calculations" accept-charset="UTF-8" method="post">']
    post calculations_path, params: { calculation: {
      argument1: 1,
      argument2: 2,
      operand:  '+'
    }}
    assert_response :success
    assert @response.body['Category must exist']
    cat = categories(:cat1)
    post calculations_path, params: { calculation: {
      argument1: 15432657476574,
      argument2: 2,
      operand:  '+',
      category_id: cat.id
    }}
    assert_response :redirect
    assert Calculation.find_by(argument1: 15432657476574)
    get calculations_path
    assert_response :success
    assert @response.body['15432657476574']
  end
end
