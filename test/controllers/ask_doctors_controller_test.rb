require 'test_helper'

class AskDoctorsControllerTest < ActionController::TestCase
  setup do
    @ask_doctor = ask_doctors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ask_doctors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ask_doctor" do
    assert_difference('AskDoctor.count') do
      post :create, ask_doctor: { description: @ask_doctor.description, name: @ask_doctor.name, title: @ask_doctor.title }
    end

    assert_redirected_to ask_doctor_path(assigns(:ask_doctor))
  end

  test "should show ask_doctor" do
    get :show, id: @ask_doctor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ask_doctor
    assert_response :success
  end

  test "should update ask_doctor" do
    patch :update, id: @ask_doctor, ask_doctor: { description: @ask_doctor.description, name: @ask_doctor.name, title: @ask_doctor.title }
    assert_redirected_to ask_doctor_path(assigns(:ask_doctor))
  end

  test "should destroy ask_doctor" do
    assert_difference('AskDoctor.count', -1) do
      delete :destroy, id: @ask_doctor
    end

    assert_redirected_to ask_doctors_path
  end
end
