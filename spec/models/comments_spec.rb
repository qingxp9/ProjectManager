require 'spec_helper'

describe "Comments" do
  before { @comment = Comment.new() }
  subject { @comment }
  it { should respond_to(:todo_id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:body) }
end
