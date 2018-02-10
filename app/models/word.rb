class Word < ApplicationRecord
  has_many :points
  has_many :people, through: :pronounces

end
