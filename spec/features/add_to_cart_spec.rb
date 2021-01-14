require 'rails_helper'

RSpec.feature "Visitor navigates to Product Details", type: :feature, js: true do

  # creates mock database info for tests
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

  scenario "Add to cart" do
    # runs test
    visit root_path
    click_on("Add", match: :first)
    
    # screenshot for debug
    # save_screenshot
    
     # verification
    expect(page).to have_content "My Cart (1)"

  end
end
