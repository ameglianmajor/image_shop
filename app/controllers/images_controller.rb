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

  def process_image
    activity = input_parameters[:activity]
    url = input_parameters[:url]
    name = url.split('/').last
    retrieved_image = retrieve_image(url)
    image_content_type = retrieved_image[:content_type]
    processed_image =
      resize_image(
        retrieved_image[:image],
        input_parameters[:width],
        input_parameters[:height],
        name)
    send_data processed_image, type: image_content_type, disposition: 'inline'
  end

  private

    def retrieve_image(url)
      fetcher = ::FileFetcher::Base.new
      response = fetcher.get_image(url)
      {image: response.body, content_type: response.env[:response_headers]['content-type'] }
    end

    def resize_image(input_blob, new_width, new_height, name)
      width = new_width.to_i
      height = new_height.to_i
      processed_image = ::Magick::ImageList.new
      processed_image.from_blob(input_blob)
      processed_image.resize!(width, height)
      processed_image_blob = processed_image.to_blob
      processed_image_blob
    end

    def input_parameters
      @input_parameters ||= params.permit(:url, :width, :height, :activity)
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
