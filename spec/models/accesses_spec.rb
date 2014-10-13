require 'spec_helper'

describe "Accesses" do
  before { @access = Access.new() }
  subject { @access }
  it { should respond_to(:project_id) }
  it { should respond_to(:user_id) }
end
