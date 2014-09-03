require 'rails_helper'

RSpec.describe "Choosing a victim" do
  it 'can return the first valid choice' do
    student_1 = Fabricate(:student)
    Fabricate(:student)
    Fabricate(:student)
    Fabricate(:student, last_call: 1.hour.ago)
    allow_any_instance_of(Array).to receive(:sample) do |array|
      array[0]
    end
    expect(Student.pick_victim).to eq student_1
  end

  it 'can return the last valid choice' do
    Fabricate(:student)
    Fabricate(:student)
    student_3 = Fabricate(:student)
    Fabricate(:student, last_call: 1.hour.ago)
    allow_any_instance_of(Array).to receive(:sample) do |array|
      array.last
    end
  expect(Student.pick_victim).to eq student_3
  end
end
