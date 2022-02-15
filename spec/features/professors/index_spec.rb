require 'rails_helper'

RSpec.describe 'Professor Index Page' do
  before :each do
    @steve = Professor.create!(name: "Steve", age: 56, specialty: "magic")
    @gilderoy = Professor.create!(name: "Gilderoy", age: 44, specialty: "looks")
    @snape = Professor.create!(name: "Snape", age: 72, specialty: "Bad Hair")
  end
  it "Lists Professors Information" do

    visit '/professors'

    expect(page).to have_content(@steve.name)
    expect(page).to have_content(@steve.age)
    expect(page).to have_content(@steve.specialty)
    expect(page).to have_content(@gilderoy.name)
    expect(page).to have_content(@gilderoy.age)
    expect(page).to have_content(@gilderoy.specialty)
    expect(page).to have_content(@snape.name)
    expect(page).to have_content(@snape.age)
    expect(page).to have_content(@snape.specialty)
  end
end
