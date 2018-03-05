# == Schema Information
#
# Table name: winners
#
#  id         :integer          not null, primary key
#  person_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Winner < ApplicationRecord
  belongs_to :person
  has_many :points
end
