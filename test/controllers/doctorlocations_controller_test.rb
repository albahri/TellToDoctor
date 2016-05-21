require 'test_helper'

class DoctorlocationsControllerTest < ActionController::TestCase
  setup do
    @doctorlocation = doctorlocations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:doctorlocations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create doctorlocation" do
    assert_difference('Doctorlocation.count') do
      post :create, doctorlocation: { address: @doctorlocation.address, doctorname: @doctorlocation.doctorname, latitude: @doctorlocation.latitude, longitude: @doctorlocation.longitude }
    end

    assert_redirected_to doctorlocation_path(assigns(:doctorlocation))
  end

  test "should show doctorlocation" do
    get :show, id: @doctorlocation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @doctorlocation
    assert_response :success
  end

  test "should update doctorlocation" do
    patch :update, id: @doctorlocation, doctorlocation: { address: @doctorlocation.address, doctorname: @doctorlocation.doctorname, latitude: @doctorlocation.latitude, longitude: @doctorlocation.longitude }
    assert_redirected_to doctorlocation_path(assigns(:doctorlocation))
  end

  test "should destroy doctorlocation" do
    assert_difference('Doctorlocation.count', -1) do
      delete :destroy, id: @doctorlocation
    end

    assert_redirected_to doctorlocations_path
  end
end
