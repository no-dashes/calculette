require 'application_system_test_case'

class CalculationsTest < ApplicationSystemTestCase

  test "successless login" do
    visit hello_path
    click_on 'log in'
    sleep 1
    fill_in "Email", with: 'test@example.com'
    sleep 1
    fill_in "Password", with: 'blahblah'
    sleep 1
    click_on "Log me in"
    sleep 1
    assert_text "User not found or password incorrect"
  end

  test "successfull login" do
    user = User.create!(
      name: 'Emil',
      email: 'test@example.com',
      password: 'blahblah',
      verification_token: 'sdsadasdsaddasd',
      verified: true
    )
    visit hello_path
    click_on 'log in'
    fill_in "Email", with: user.email
    fill_in "Password", with: 'blahblah'
    click_on "Log me in"
    assert_text "Logged in. Welcome!"
    assert_text "All Calculations"
    sleep 1
  end

end
