class Course < ApplicationRecord
  validates :short_name, presence: true, length: {minimum: 5, maximim:10}
  validates :name, presence: true, length: {minimum: 5, maximim:50}
  validates :description, presence: true, length: {minimum: 20, maximum: 256}
end