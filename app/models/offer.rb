# frozen_string_literal: true

require 'uri'

class Offer < ApplicationRecord
  validates :advertiser_name, :url, :description, :starts_at, presence: true
  validates :advertiser_name, uniqueness: true
  validates_length_of :description, maximum: 500
  validate :url_format

  before_create :set_default_state
  before_save :set_state

  private

  def set_default_state
    self.state = 'disabled'
  end

  def set_state
    if DateTime.now >= starts_at
      self.state = 'enabled'
    elsif DateTime.now <= ends_at
      self.state = 'disabled'
    elsif ends_at.blank?
      self.state = 'enabled'
    end
  end

  def url_format
    errors.add(:url, :invalid_format) unless url =~ URI::DEFAULT_PARSER.make_regexp
  end
end
