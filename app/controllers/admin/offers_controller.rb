class Admin::OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy, :change_state]

  # GET /offers
  def index
    @offers = Offer.order(:created_at).all
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

  # POST /offers/1/change_state
  def change_state
    if @offer.state == "enabled"
      respond_to do |format|
        if @offer.update_column(:state, "disabled")
          format.html { redirect_to admin_offers_path, notice: 'Offer State was successfully updated.' }
        else
          format.html { redirect_to admin_offers_path, notice: 'Offer State cannot be updated.' }
        end
      end
    else
      @offer.state = "enabled"
      respond_to do |format|
        if @offer.save!
          notice = @offer.state == "disabled" ? "Offer State cannot be updated because of some validation rule." : "Offer State updated with success"
          format.html { redirect_to admin_offers_path, notice: notice }
        end
      end
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
