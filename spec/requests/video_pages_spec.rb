require 'spec_helper'

describe "Video pages" do

  subject { page }

  describe "index" do
    # let(:user) { FactoryGirl.create(:user) }

    before { visit videos_path }

    it { should have_title("All videos") }
    it { should have_content("All videos") }

    describe "pagination" do

      # before(:all) { 30.times { FactoryGirl.create(:video, user: user) } }
      # after(:all) { Video.delete_all }

      # it { should have_selector("ul.pagination") }

    #   it "should list each video" do
    #     Video.paginate(page: 1).each do |video|
    #       expect(page).to have_selector("li", text: video.title)
    #     end
    #   end

    end

  end

end
