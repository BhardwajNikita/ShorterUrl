class LinksController < ApplicationController

  # GET /links or /links.json
  def index
    @links = Link.includes(:tracks).all
  end

  # GET /links/1 or /links/1.json
  def show
    @link = Link.find_by_slug(params[:slug])
    return redirect_to '/404', status: 404 if @link.nil?
    track = Track.find_or_create_by(ip_address: request.remote_ip)
    @link.tracks << track
    redirect_to @link.url, allow_other_host: true
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  # POST /links or /links.json
  def create
    @link = Link.new(link_params)

    respond_to do |format|
      if @link.save
        format.js
      else
        format.html
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def link_params
    params.require(:link).permit(:url)
  end
end
