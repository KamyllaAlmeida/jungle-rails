require 'rails_helper'

RSpec.feature "Visitor add product on the cart", type: :feature, js: true do

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

  scenario "Number of products in the cart changed" do

    visit root_path
    first('article').click_on 'Add'
    sleep 5
    save_screenshot "test.png"
 
  #expect(page).to have_text ' My Cart (1)'
  expect(page).to have_content ' My Cart (1)'
  end
end