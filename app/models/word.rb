# == Schema Information
#
# Table name: words
#
#  id          :integer          not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  archived_at :datetime
#

class Word < ApplicationRecord
  has_many :points
  has_many :people, through: :points, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  before_validation :downcase_name

  date_as_bool :archived_at

  scope :active, -> { where(archived_at: nil) }

  def self.archived(archived = true)
    if archived
      where.not(archived_at: nil)
    else
      where(archived_at: nil)
    end
  end

  private

  def downcase_name
    self.name ||= ''
    self.name = self.name.downcase
  end
end
