class ListingsController < ApplicationController
  def index
  	@listings = Listing.all
  end

  def show
  	@listing = Listing.find(params[:id])
  end

  def new
  	@listings = Listing.new
  end

  def create
  	@listings = Listing.new(listing_params)
  	if @listings.save
  		redirect_to listings_path
  	else
  		render :new
  	end
  end
  
  private
  def listing_params
  	params.require(:listing).permit(:item, :details)
  end
end
