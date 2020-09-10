class Offer < ApplicationRecord
  require 'uri'

  validates :advertiser_name, :url, :description, :starts_at, required: true
  validates :advertiser_name, unique: true
  validates_length_of :description, :maximum => 500, allow_blank: true
  validates :url_format

  private
  def url_format
    unless url =~ URI::regexp
      errors.add(:url, :invalid_format)
    end
  end
end
