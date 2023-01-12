class ArtworksController < ApplicationController
  def index
    # if params.has_key?(:username)
    #   @user = User.find(params[:username])
    #   render json: @user
    # else
      @artworks = Artwork.all
      render json: @artworks
    # end
    
  end

  def create
    @artwork = Artwork.new(artwork_params)
    if @user.save!
      redirect_to artworks_url(@artwork)
    else
      render json: @artwork.errors.full_messages, status: 422
    end
  end

  def show
    @artwork = Artwork.find_by(id: params[:id])
    render json: @artwork
  end

  def destroy
    @artwork = Artwork.find_by(id: params[:id])
    if @artwork.destroy
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: 422
    end
  end

  def update
    @artwork = Artwork.find(params[:id])

    if @artwork.update(artwork_params)
      redirect_to artworks_url(@artwork)
    else
      render json: @artwork.errors.full_messages, status: 422
    end
  end

  private
  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end
