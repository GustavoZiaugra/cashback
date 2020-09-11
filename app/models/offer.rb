class Offer < ApplicationRecord
  require 'uri'

  validates :advertiser_name, :url, :description, :starts_at, presence: true
  validates :advertiser_name, uniqueness: true
  validates_length_of :description, :maximum => 500
  validate :url_format

  before_create :set_default_state
  before_save :set_state

  STATES = ["enabled", "disabled"].freeze

  private
  def set_default_state
    self.state = "disabled"
  end

  def set_state
    if DateTime.now >= self.starts_at
      self.state = "enabled"
    elsif DateTime.now <= self.ends_at
      self.state = "disabled"
    end
  end

  def url_format
    unless url =~ URI::regexp
      errors.add(:url, :invalid_format)
    end
  end
end
