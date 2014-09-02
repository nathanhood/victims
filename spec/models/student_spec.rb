require 'rails_helper'

RSpec.describe "Choosing a victim" do
  it 'can return the first valid choice' do
		student_1 = Fabricate(:student)
		Fabricate(:student)
		Fabricate(:student)
		Fabricate(:student, last_call: 1.hour.ago)
    Array.any_instance.stub(:sample) do |array|
      array[0]
    end
		Student.pick_victim.should == student_1
	end

  it 'can return the last valid choice' do
		Fabricate(:student)
		Fabricate(:student)
		student_3 = Fabricate(:student)
		Fabricate(:student, last_call: 1.hour.ago)
    Array.any_instance.stub(:sample) do |array|
      array.last
    end
		Student.pick_victim.should == student_3
	end
end
