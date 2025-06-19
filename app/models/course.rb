class Course < ApplicationRecord
  belongs_to :teacher
  has_many :enrollments
  has_many :students, through: :enrollments
  has_many :assignments
end
