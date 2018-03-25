# == Schema Information
#
# Table name: cover_images
#
#  id         :integer          not null, primary key
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CoverImage < ApplicationRecord

  validates_presence_of :url

  def self.active
    CoverImage.order('created_at DESC').first
  end

end
