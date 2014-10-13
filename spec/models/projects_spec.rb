require 'spec_helper'

describe "Projects" do
  before { @project = Project.new() }
  subject { @project }
  it { should respond_to(:title) }
  it { should respond_to(:describe) }
  it { should respond_to(:team_id) }
end
