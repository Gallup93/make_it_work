require 'rails_helper'

RSpec.describe "Project Show Page" do
  context "As a visitor" do
    it "I see that project name, material, and theme" do
      furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
      lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

      visit "/projects/#{lit_fit.id}"

      expect(page).to have_content(lit_fit.name)
      expect(page).to have_content(lit_fit.material)
      expect(page).to have_content(lit_fit.challenge.theme)
    end
  end

  it "displays number of contestants on this project" do
    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)

    news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

    jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

    ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
    ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)

    visit "/projects/#{news_chic.id}"

    expect(page).to have_content("Number of Contestants: 2")
  end
end


# User Story 3 of 3
# As a visitor,
# When I visit a project's show page
# I see a count of the number of contestants on this project
# ​
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings
#   Number of Contestants: 3 )
