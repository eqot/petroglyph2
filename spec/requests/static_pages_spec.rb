require 'spec_helper'

describe "Static pages" do

  let(:base_title) { "probless" }

  subject { page }

  describe "Home page" do

    before { visit root_path }

    it { should have_content('probless') }
    it { should have_title("#{base_title}") }
    it { should_not have_title('| Home') }

  end

  describe "About page" do

    before { visit about_path }

    it { should have_content('About') }
    it { should have_title("#{base_title} | About") }

  end

  it "should have the right links on the layout" do
    visit root_path

    click_link "About"
    expect(page).to have_title("#{base_title} | About")
    click_link "Problems"
    expect(page).to have_title("#{base_title} | Problems")
    click_link "Solutions"
    expect(page).to have_title("#{base_title} | Solutions")
    click_link "Home"
    expect(page).to have_title("#{base_title}")

    click_link "Learn more >>"
    expect(page).to have_title("#{base_title} | About")
    click_link "probless"
    expect(page).to have_title("#{base_title}")

    click_link "Sign up"
    expect(page).to have_title("#{base_title} | Sign up")
  end

end
