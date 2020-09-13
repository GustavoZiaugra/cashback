# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::OffersController, type: :controller do
  context 'Endpoints' do
    let(:offer) { create(:offer) }

    describe 'GET index' do
      it 'returns 200 with index' do
        get :index
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET show' do
      it 'returns 200 with show' do
        get :show, params: { id: offer.id }
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET new' do
      it 'returns 200 with new' do
        get :new
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET edit' do
      it 'returns 200 with edit' do
        get :edit, params: { id: offer.id }
        expect(response).to have_http_status(200)
      end
    end

    describe 'POST create' do
      it 'returns 302 with create' do
        post :create, params: { offer: { advertiser_name: 'Wallmart', url: 'https://uol.com.br',
                                         description: 'foobar', starts_at: DateTime.now, premium: true } }
        expect(response).to have_http_status(302)

        offer = Offer.first

        assert offer.advertiser_name == 'Wallmart'
      end
    end

    describe 'POST change_state' do
      it 'returns 302 with change_state' do
        post :change_state, params: { id: offer.id }

        expect(response).to have_http_status(302)

        assert offer.state == 'disabled'
      end
    end

    describe 'DELETE destroy' do
      it 'return 302 with destroy' do
        delete :destroy, params: { id: offer.id }

        expect(response).to have_http_status(302)
        assert Offer.all == []
      end
    end

    describe 'PATCH update' do
      it 'return 302 with update' do
        patch :update, params: { id: offer.id, offer: { id: offer.id, premium: true } }

        expect(response).to have_http_status(302)
        offer.reload
        assert offer.premium == true
      end
    end
  end
end
