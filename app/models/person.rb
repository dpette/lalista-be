# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Person < ApplicationRecord
  has_many :points
  has_many :words, through: :points, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  before_validation :humanize_name

  def self.ranking
    Point.not_won
      .group(:person_id)
      .select('person_id, COUNT(*) AS points_count')
      .order('points_count DESC')
  end

  private

  def humanize_name
    self.name ||= ''
    self.name = self.name.humanize
  end
end
