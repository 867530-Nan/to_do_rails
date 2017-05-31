class ListingsController < ApplicationController
  def index
  	@listings = Listing.all
  end

  def show
  	@listings = Listing.find(params[:id])
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

  def edit
  	@listings = Listing.find(params[:id])
  end

  def update
  	@listings = Listing.find(params[:id])
  	if @listings.update(listing_params)
  		redirect_to listing_path(@listings)
  	else
  		render :edit
  	end
  end

  def destroy
  	@listings = Listing.find(params[:id])
  	if @listings.destroy
  		redirect_to listings_path
  	else
  		redirect_to listings_path
  	end
  end
  
  private
  def listing_params
  	params.require(:listing).permit(:item, :details)
  end
end
