class CoverImage < ApplicationRecord

  validates_presence_of :url

  def self.active
    CoverImage.order('created_at DESC').first
  end

end
