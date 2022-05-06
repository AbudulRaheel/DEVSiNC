# frozen_string_literal: true

require 'test_helper'

class WelcomepageControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get welcomepage_index_url
    assert_response :success
  end
end
