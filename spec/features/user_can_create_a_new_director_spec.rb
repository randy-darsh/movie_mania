require 'rails_helper'

describe 'When a user visits the new director page' do
  it 'they can create a new director' do
    visit new_director_path

    fill_in "director[name]", with: "Guy Ritchie"

    click_on("Create Director")

    expect(current_path).to eq("/directors/#{Director.last.id}")

    expect(page).to have_content("Guy Ritchie")
  end
end