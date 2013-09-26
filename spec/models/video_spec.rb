require 'spec_helper'

describe Video do

  let(:user) { FactoryGirl.create(:user) }
  before do
    @video = user.videos.build(url: "Lorem ipsum", title: "Title", description: "Description")
    # @video = Video.new(url: "Lorem ipsum", user_id: user.id)
  end

  subject { @video }

  it { should respond_to(:url) }
  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @video.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank url" do
    before { @video.url = " " }
    it { should_not be_valid }
  end

end
