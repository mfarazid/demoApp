require 'rails_helper'

RSpec.describe "users/show", :type => :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :fisrt_name => "Fisrt Name",
      :last_name => "Last Name",
      :email => "Email",
      :role_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Fisrt Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/1/)
  end
end
