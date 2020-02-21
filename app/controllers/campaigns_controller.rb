class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.order(:name)
  end

  def show
    @campaign = Campaign.find(params[:id])
  end
end
