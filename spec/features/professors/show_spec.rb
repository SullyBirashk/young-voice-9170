require 'rails_helper'

RSpec.describe 'Professor Show Page' do
  before :each do
    @steve = Professor.create!(name: "Steve", age: 56, specialty: "magic")
    @student_1 = @steve.students.create!(name: "Harry Potter", age: 18, house: "Ravenclaw")
    @student_2 = @steve.students.create!(name: "Ron Weasley", age: 17, house: "Slytherin")
    @student_3 = @steve.students.create!(name: "Dobby", age: 16, house: "Hufflepuff")
    @student_4 = @steve.students.create!(name: "Draco Malfoy", age: 15, house: "Griffindor")
  end
  it "Lists Professors Students" do

    visit "/professors/#{@steve.id}"

    expect(page).to have_content(@student_1.name)
    expect(page).to have_content(@student_1.age)
    expect(page).to have_content(@student_1.house)
    expect(page).to have_content(@student_2.name)
    expect(page).to have_content(@student_2.age)
    expect(page).to have_content(@student_2.house)
    expect(page).to have_content(@student_3.name)
    expect(page).to have_content(@student_3.age)
    expect(page).to have_content(@student_3.house)
    expect(page).to have_content(@student_4.name)
    expect(page).to have_content(@student_4.age)
    expect(page).to have_content(@student_4.house)

  end

  it "Shows Average age of all students per professor" do

    visit "/professors/#{@steve.id}"

    expect(page).to have_content(16.5)
  end
end
