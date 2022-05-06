# frozen_string_literal: true

require 'test_helper'

class LogoutCartsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get logout_carts_index_url
    assert_response :success
  end
end
