require 'rails_helper'

RSpec.describe User::OffersController, type: :controller do
  context "Endpoints" do
    describe "GET index" do
      it "returns 200 with index" do
        get :index
        expect(response).to have_http_status(200)
      end
    end
  end
end
