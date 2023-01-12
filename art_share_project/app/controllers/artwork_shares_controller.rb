class ArtworkSharesController < ApplicationController
  def create
    @artwork_share = ArtworkShare.new(artwork_share_params)
    if @artwork_share.save!
      # redirect_to artwork_share_url(@artwork_share)
        render plain: "Success!"

    else
      render json: artwork_share.errors.full_messages, status: 422
    end
  end

  def destroy
    @artwork_share = ArtworkShare.find_by(id: params[:id])
    if artwork_share.destroy
      render json: @artwork_share
    else
      render json: artwork_share.errors.full_messages, status: 422
    end
  end

  private
  def artwork_share_params
    params.require(:artwork_share).permit(:artwork_id, :viewer_id)
  end
end
