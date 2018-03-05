# == Schema Information
#
# Table name: words
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Word < ApplicationRecord
  has_many :points
  has_many :people, through: :points, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  before_validation :downcase_name

  private

  def downcase_name
    self.name ||= ''
    self.name = self.name.downcase
  end
end
