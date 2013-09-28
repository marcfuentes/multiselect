require 'test_helper'

class AuthorbooksControllerTest < ActionController::TestCase
  setup do
    @authorbook = authorbooks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:authorbooks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create authorbook" do
    assert_difference('Authorbook.count') do
      post :create, authorbook: { author_id: @authorbook.author_id, book_id: @authorbook.book_id }
    end

    assert_redirected_to authorbook_path(assigns(:authorbook))
  end

  test "should show authorbook" do
    get :show, id: @authorbook
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @authorbook
    assert_response :success
  end

  test "should update authorbook" do
    put :update, id: @authorbook, authorbook: { author_id: @authorbook.author_id, book_id: @authorbook.book_id }
    assert_redirected_to authorbook_path(assigns(:authorbook))
  end

  test "should destroy authorbook" do
    assert_difference('Authorbook.count', -1) do
      delete :destroy, id: @authorbook
    end

    assert_redirected_to authorbooks_path
  end
end
