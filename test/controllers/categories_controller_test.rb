require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  def setup
    @category = Category.create(name: "sports")
     @user = User.create(username: "john", email: "john@example.com", password: "password", admin: true)
  end
  
  test "should get catergories index" do
    get :index
    assert_response :success
  end
  
  test "should get new" do
    sign_in_as(@user, "password")
    get new_category_path
    assert_response :success
  end
  
  test "should get show" do
    get :show, params: {id: @category.id}
  end
   
   test "should redirect create when admin not logged in" do
    assert_no_difference 'Category.count' do
      post(:create, params: { category: { name: "sports"}})
    end
    assert_redirected_to categories_path
  end
end