require 'spec_helper'

describe "Events" do
  before { @event = Event.new() }
  subject { @event }
  it { should respond_to(:todo_id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:content) }
  it { should respond_to(:action) }
end
