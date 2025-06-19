class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :student
  has_one :teacher

  validates :role, presence: true, inclusion: { in: %w[student teacher] }
end
