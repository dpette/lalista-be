class Person < ApplicationRecord
  has_many :pronounce
  has_many :words, through: :pronounces
end
