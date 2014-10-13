require 'spec_helper'

describe "Users" do
  before { @user = User.new(email: "user@example.com", team_id: 3) }
  subject { @user }
  it { should respond_to(:email) }
  it { should respond_to(:team_id) }
end
