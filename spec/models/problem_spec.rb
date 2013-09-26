require 'spec_helper'

describe Problem do

  let(:user) { FactoryGirl.create(:user) }
  before { @problem = user.problems.build(title: "Title", description: "Description") }

  subject { @problem }

  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:agree) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @problem.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank title" do
    before { @problem.title = " " }
    it { should_not be_valid }
  end

end
