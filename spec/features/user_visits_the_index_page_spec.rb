require 'rails_helper'

describe "When a user visits the index page" do

  before :each do
    @movie_1 = Movie.create(title: "Saving Private Ryan", description: "WWII movie about saving Matt Damon")
    @movie_2 = Movie.create(title: "Office Space", description: "Work sucks.")
  end

  it "they can see all of the movies" do

    visit movies_path


    expect(page).to have_content(@movie_1.title)
    expect(page).to have_content(@movie_1.description)
    expect(page).to have_content(@movie_2.title)
    expect(page).to have_content(@movie_2.description)
  end
end