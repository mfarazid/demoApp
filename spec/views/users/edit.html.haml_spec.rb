require 'rails_helper'

RSpec.describe "users/edit", :type => :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :fisrt_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :role_id => 1
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input#user_fisrt_name[name=?]", "user[fisrt_name]"

      assert_select "input#user_last_name[name=?]", "user[last_name]"

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_role_id[name=?]", "user[role_id]"
    end
  end
end
