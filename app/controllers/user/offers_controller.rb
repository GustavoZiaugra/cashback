# frozen_string_literal: true

module User
  class OffersController < ApplicationController
    def index
      @offers = Offer.where(state: 'enabled').order(premium: :desc)
    end
  end
end
