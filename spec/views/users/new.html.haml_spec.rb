require 'rails_helper'

RSpec.describe "users/new", :type => :view do
  before(:each) do
    assign(:user, User.new(
      :fisrt_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :role_id => 1
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_fisrt_name[name=?]", "user[fisrt_name]"

      assert_select "input#user_last_name[name=?]", "user[last_name]"

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_role_id[name=?]", "user[role_id]"
    end
  end
end
