# == Schema Information
#
# Table name: points
#
#  id         :integer          not null, primary key
#  word_id    :integer
#  person_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  winner_id  :integer
#

class Point < ApplicationRecord
  belongs_to :person
  belongs_to :word
  belongs_to :winner, optional: true

  scope :not_won, -> { where(winner_id: nil) }

end
