require 'spec_helper'

describe "Todos" do
  before { @todo = Todo.new() }
  subject { @todo }
  it { should respond_to(:goal) }
  it { should respond_to(:user_id) }
  it { should respond_to(:project_id) }
  it { should respond_to(:limit_time) }
  it { should respond_to(:status) }
end
