require 'test_helper'

class TasklistDemosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tasklist_demos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tasklist_demo" do
    assert_difference('TasklistDemo.count') do
      post :create, :tasklist_demo => { }
    end

    assert_redirected_to tasklist_demo_path(assigns(:tasklist_demo))
  end

  test "should show tasklist_demo" do
    get :show, :id => tasklist_demos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tasklist_demos(:one).to_param
    assert_response :success
  end

  test "should update tasklist_demo" do
    put :update, :id => tasklist_demos(:one).to_param, :tasklist_demo => { }
    assert_redirected_to tasklist_demo_path(assigns(:tasklist_demo))
  end

  test "should destroy tasklist_demo" do
    assert_difference('TasklistDemo.count', -1) do
      delete :destroy, :id => tasklist_demos(:one).to_param
    end

    assert_redirected_to tasklist_demos_path
  end
end
