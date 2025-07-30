
require 'rails_helper'

RSpec.describe "SiteLayout", type: :system do
  it "has the correct layout links" do
    visit root_path
    expect(page).to have_link(href: root_path)
    
    # Click the mobile menu toggle to reveal navigation links
    find('.navbar-toggler').click
    
    expect(page).to have_link('Help', href: help_path)
    expect(page).to have_link('About', href: about_path)
    expect(page).to have_link('Contact', href: contact_path)
  end
end
