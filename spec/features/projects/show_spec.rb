require 'rails_helper'

RSpec.describe "Project Show Page" do
  context "As a visitor" do
    it "I see that project name, material, and theme" do
      furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
      lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

      visit "/projects/#{lit_fit.id}"

      expect(page).to have_content(lit_fit.name)
      expect(page).to_not have_content(lit_fit.material)
      expect(page).to_not have_content(lit_fit.theme)
    end
  end
end
