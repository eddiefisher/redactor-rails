class RedactorRails::DocumentsController < ApplicationController
  before_filter :authenticate_admin_user! if RedactorRails.document_model.new.respond_to?(:admin_user_id)

  def index
    @documents = RedactorRails.document_model.where(
        RedactorRails.document_model.new.respond_to?(:admin_user_id) ? { admin_user_id: current_admin_user.id } : { })
    render :json => @documents.to_json
  end

  def create
    @document = RedactorRails::Document.new

    file = params[:file]
    @document.data = RedactorRails::Http.normalize_param(file, request)
    if @document.respond_to?(:admin_user_id)
      @document.user = current_admin_user
      @document.assetable = current_admin_user
    end

    if @document.save
      render :text => { :filelink => @document.url, :filename => @document.filename }.to_json
    else
      render :nothing => true
    end
  end
end
