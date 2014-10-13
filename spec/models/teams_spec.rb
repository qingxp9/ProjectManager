require 'spec_helper'

describe "Teams" do
  before { @team = Team.new() }
  subject { @team }
  it { should respond_to(:name) }
end
