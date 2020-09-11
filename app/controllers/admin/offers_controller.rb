class Admin::OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy, :change_state]

  # GET /offers
  # GET /offers.json
  def index
    @offers = Offer.all
  end

  # GET /offers/1
  def show
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers
  def create
    @offer = Offer.new(offer_params)
    respond_to do |format|
      if @offer.save
        format.html { redirect_to admin_offers_path, notice: 'Offer was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /offers/1
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to admin_offers_path, notice: 'Offer was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /offers/1
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to admin_offers_path, notice: 'Offer was successfully destroyed.' }
    end
  end

  def change_state
    if @offer.state == "enabled"
      @offer.update_column(:state,"disabled")
    else
      @offer.update_column(:state, "enabled")
    end
    respond_to do |format|
      format.html { redirect_to admin_offers_path, notice: 'Offer State was successfully updated.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def offer_params
      params.require(:offer).permit(:advertiser_name, :url, :description, :starts_at, :ends_at, :premium, :state)
    end
end
