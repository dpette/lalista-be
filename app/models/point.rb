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

  def creation_date
    self.created_at.to_date
  end

  def self.people_grouped_data
    all.includes(:person).group_by(&:person_id).map do |person_id, points|
      # person_chart_data = {}
      person = points.first.person
      # points.group_by(&:creation_date).each do |date, date_points|
      #   person_chart_data[date] = date_points.size
      # end
      {person: person, points: points.group_by(&:creation_date)}
    end

    # p_c_d
  end

  def self.people_chart_data(from = 1.week.ago, to = Time.now)
    from ||= 1.week.ago
    to ||= Time.now
    dates_range = (from.to_date..to.to_date)
    p_c_d = {
      labels: dates_range.to_a,
      datasets: []
    }

    p_c_d[:datasets] << people_grouped_data.map do |person_points|
      person = person_points[:person]
      points = person_points[:points]

      dataset = {
        label: person.name
      }

      dataset[:data] = dates_range.map do |date|
        points[date].to_a.size
      end

      dataset
    end
    p_c_d
  end

end
