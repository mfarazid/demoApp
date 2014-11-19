require 'rails_helper'

RSpec.describe "users/index", :type => :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :fisrt_name => "Fisrt Name",
        :last_name => "Last Name",
        :email => "Email",
        :role_id => 1
      ),
      User.create!(
        :fisrt_name => "Fisrt Name",
        :last_name => "Last Name",
        :email => "Email",
        :role_id => 1
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Fisrt Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
