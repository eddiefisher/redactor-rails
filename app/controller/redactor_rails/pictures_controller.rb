class RedactorRails::PicturesController < ApplicationController
  before_filter :authenticate_admin_user! if RedactorRails.picture_model.new.respond_to?(:user_admin_id)

  def index
    @pictures = RedactorRails.picture_model.where(
        RedactorRails.picture_model.new.respond_to?(:user_admin_id) ? { user_admin_id: current_admin_user.id } : { })
    render :json => @pictures.to_json
  end

  def create
    @picture = RedactorRails::Picture.new

    file = params[:file]
    @picture.data = RedactorRails::Http.normalize_param(file, request)
    if @picture.respond_to?(:user_admin_id)
      @picture.user = current_admin_user
      @picture.assetable = current_admin_user
    end

    if @picture.save
      render :text => { :filelink => @picture.url }.to_json
    else
      render :nothing => true
    end
  end
end
