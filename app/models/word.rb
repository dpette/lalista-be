class Word < ApplicationRecord
  has_many :pronounces
  has_many :people, through: :pronounces
  
end
