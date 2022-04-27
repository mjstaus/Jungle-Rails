require 'rails_helper'

RSpec.feature "Visitor navigates from home page to individual product page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),  
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They click a product detail button and see product show page" do
    # ACT
    visit root_path
    first('.btn-default').click
    # DEBUG
    save_screenshot
    # VERIFY
    expect(page).to have_link 'Apparel', href: "/categories/1"
  end
end
