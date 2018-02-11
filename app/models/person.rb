class Person < ApplicationRecord
  has_many :points
  has_many :words, through: :points, dependent: :destroy
end
