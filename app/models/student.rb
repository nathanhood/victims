class Student < ActiveRecord::Base
  Student::ActiveRecord::Base.after_initialize :init
  validates_presence_of :name

  default_scope ->{ order("id ASC") }
  scope :not_called_on_today, ->{ where("last_call < ?", Date.today) }

  def init
    self.last_call ||= 2.days.ago
  end

  def self.pick_victim
     #This assumes the not_called_on_today is a named scope, defined elsewhere in the class
    possible_students = Student.not_called_on_today.all
    victim = possible_students.sample # Gives us a random student from the list
    victim.last_call = Date.today if victim
    victim
  end
end
