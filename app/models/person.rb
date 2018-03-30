# == Schema Information
#
# Table name: people
#
#  id          :integer          not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  archived_at :datetime
#

class Person < ApplicationRecord
  has_many :points
  has_many :words, through: :points, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  before_validation :humanize_name

  date_as_bool :archived_at

  scope :active, -> { where(archived_at: nil) }

  def self.ranking
    Point.not_won
      .group(:person_id)
      .select('person_id, COUNT(*) AS points_count')
      .order('points_count DESC')
  end

  def self.archived(archived = true)
    if archived
      where.not(archived_at: nil)
    else
      where(archived_at: nil)
    end
  end

  def rank
    r = Person.ranking.map(&:person_id).index(self.id)
    return Person.active.count if !r
    
    Person.ranking.map(&:person_id).index(self.id) + 1
  end

  def points_count
    self.points.not_won.count
  end

  def total_points_count
    self.points.count
  end

  private

  def humanize_name
    self.name ||= ''
    self.name = self.name.humanize
  end
end
