require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest
  def setup
    @admin     = users(:michael)
    @non_admin = users(:archer)
    @non_active = users(:non_active)
  end

  test "show non-active user redirecting home" do
    log_in_as(@admin)
    get user_path(@non_active)
    assert_redirected_to root_url
    follow_redirect!

    get user_path(@non_admin)
    assert_template 'users/show'
  end
end
