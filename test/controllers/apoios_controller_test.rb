require 'test_helper'

class ApoiosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @apoio = apoios(:one)
  end

  test "should get index" do
    get apoios_url
    assert_response :success
  end

  test "should get new" do
    get new_apoio_url
    assert_response :success
  end

  test "should create apoio" do
    assert_difference('Apoio.count') do
      post apoios_url, params: { apoio: { causa_id: @apoio.causa_id, user_id: @apoio.user_id } }
    end

    assert_redirected_to apoio_url(Apoio.last)
  end

  test "should show apoio" do
    get apoio_url(@apoio)
    assert_response :success
  end

  test "should get edit" do
    get edit_apoio_url(@apoio)
    assert_response :success
  end

  test "should update apoio" do
    patch apoio_url(@apoio), params: { apoio: { causa_id: @apoio.causa_id, user_id: @apoio.user_id } }
    assert_redirected_to apoio_url(@apoio)
  end

  test "should destroy apoio" do
    assert_difference('Apoio.count', -1) do
      delete apoio_url(@apoio)
    end

    assert_redirected_to apoios_url
  end
end
