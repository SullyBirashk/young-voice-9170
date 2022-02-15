require 'rails_helper'

RSpec.describe 'Students Index Page' do
  before :each do
    @steve = Professor.create!(name: "Steve", age: 56, specialty: "magic")
    @gilderoy = Professor.create!(name: "Gilderoy", age: 44, specialty: "looks")
    @snape = Professor.create!(name: "Snape", age: 72, specialty: "Bad Hair")
    @wizard = Professor.create!(name: "Wizard", age: 772, specialty: "Ice")

    @harry = Student.create!(name: "Harry Potter", age: 24, house: "Ravenclaw")
    @ron = Student.create!(name: "Ron Weasley", age: 18, house: "Slytherin")
    @dobby = Student.create!(name: "Dobby", age: 144, house: "Hufflepuff")
    @draco = Student.create!(name: "Draco Malfoy", age: 17, house: "Griffindor")
    @emma = Student.create!(name: "Emma Watson", age: 23, house: "Slytherin")
    @james = Student.create!(name: "James Franco", age: 13, house: "Ravenclaw")

    ProfessorStudent.create!(student: @harry, professor: @steve)
    ProfessorStudent.create!(student: @harry, professor: @gilderoy)
    ProfessorStudent.create!(student: @harry, professor: @snape)
    ProfessorStudent.create!(student: @harry, professor: @wizard)

    ProfessorStudent.create!(student: @ron, professor: @steve)
    ProfessorStudent.create!(student: @ron, professor: @gilderoy)

    ProfessorStudent.create!(student: @dobby, professor: @snape)

    ProfessorStudent.create!(student: @draco, professor: @steve)
    ProfessorStudent.create!(student: @draco, professor: @gilderoy)
    ProfessorStudent.create!(student: @draco, professor: @snape)
    ProfessorStudent.create!(student: @draco, professor: @wizard)

    ProfessorStudent.create!(student: @emma, professor: @steve)
    ProfessorStudent.create!(student: @emma, professor: @gilderoy)

    ProfessorStudent.create!(student: @james, professor: @steve)
    ProfessorStudent.create!(student: @james, professor: @snape)
    ProfessorStudent.create!(student: @james, professor: @wizard)

  end
  it "Lists Students Information" do

    visit "/students"

    expect(page).to have_content(@harry.name)
    expect(page).to have_content(@harry.professors.count)
    expect(page).to have_content(@ron.name)
    expect(page).to have_content(@ron.professors.count)
    expect(page).to have_content(@dobby.name)
    expect(page).to have_content(@dobby.professors.count)
    expect(page).to have_content(@draco.name)
    expect(page).to have_content(@draco.professors.count)
    expect(page).to have_content(@emma.name)
    expect(page).to have_content(@emma.professors.count)
    expect(page).to have_content(@james.name)
    expect(page).to have_content(@james.professors.count)
  end
end
