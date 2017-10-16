require 'rails_helper'

describe 'When a user visits the new movie page' do
  it 'they can create a new movie' do
    director = Director.create(name: "Guy Ritchie")
    visit ("/directors/#{director.id}/movies/new")

    fill_in "movie[title]", with: "Snatch"
    fill_in "movie[description]", with: "Benicio del Toro steals a diamond. Hilarity ensues."

    click_on("Create Movie")

    expect(current_path).to eq("/directors/#{director.id}/movies")

    expect(page).to have_content("Snatch")
    expect(page).to have_content("Benicio del Toro steals a diamond. Hilarity ensues.")
  end
end
