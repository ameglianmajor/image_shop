require 'file-fetcher/file-fetcher'

class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  # GET /images
  # GET /images.json
  def index
    @images = Image.all
  end

  # GET /images/1
  # GET /images/1.json
  def show
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(image_params)

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def crop_image
    image = Image.retrieve crop_parameters[:url]
    cropped_image = image.crop_image(
      crop_parameters[:upper_left_corner],
      crop_parameters[:width],
      crop_parameters[:height]
    )
    send_data cropped_image,
      type: image.content_type,
      disposition: 'inline'
  end

  def resize_image
    image = Image.retrieve resize_parameters[:url]
    resized_image = image.resize_image(
      resize_parameters[:width],
      resize_parameters[:height]
    )
    send_data resized_image,
      type: image.content_type,
      disposition: 'inline'
  end

  private

  def resize_parameters
    @resize_parameters ||= params.permit(
      :url,
      :width,
      :height
    )
  end

  def crop_parameters
    @crop_parameters ||= params.permit(
      :url,
      :width,
      :height,
      :upper_left_corner => [:x, :y]
    )
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:title)
    end
end
