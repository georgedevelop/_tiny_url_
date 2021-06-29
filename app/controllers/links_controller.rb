class LinksController < ApplicationController
  before_action :set_link, only: %i[ show info ]

  # GET /links/1 or /links/1.json
  def show
    @link.clicks.create(ip_address: request.remote_ip)
    redirect_to @link.full_url
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  # GET /links/1/info
  def info
  end

  # POST /links or /links.json
  def create
    @link = Link.new(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to info_path(@link.slug), notice: "Link was successfully created." }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { redirect_to new_link_path, alert: @link.errors.full_messages.join(", ") }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find_by(slug: params[:slug])
    end

    # Only allow a list of trusted parameters through.
    def link_params
      params.require(:link).permit(:full_url, :title, :slug)
    end
end
