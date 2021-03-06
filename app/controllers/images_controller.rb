require 'file-fetcher/file-fetcher'
require 'image_shop/regexp'

# This controller handles the processing of images. It is a standard resourceful
# controller, which also has endpoints to handle file operations such as
# resizing and cropping images.
class ImagesController < ApplicationController
  #extend ImageShop::Regexp
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
      format.html do
        redirect_to images_url,
        notice: 'Image was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  api :GET, 'images/crop_image', "Request a cropped image."
  description <<-EOS
    This endpoint is used to crop an image whose url is provided. This call requires
    a url, a new width, a new height, and the coordinates of a point in the original
    image. The point that is provided will act as the upper-left
    corner of the cropped image. Upon successful completion, a cropped image
    with the requested properties will be sent back to the user.
  EOS
  param :url, ImageShop::Regexp.uri, desc: 'A url for the image to be cropped. This url should be sent in url-encoded format.', required: true
  param :upper_left_corner, Hash, required: true do
    param :x, ImageShop::Regexp.positive_integer, desc: 'x coordinate of the upper-left corner of the cropped image.', required: true
    param :y, ImageShop::Regexp.positive_integer, desc: 'y coordinate of the upper-left corner of the cropped image.', required: true
  end
  param :width, ImageShop::Regexp.positive_integer, desc: 'The width of the new cropped image.', required: true
  param :height, ImageShop::Regexp.positive_integer, desc: 'The height of the new cropped image.', required: true
  error 400, 'Bad Request. Please check that all parameters were provided and that the request is syntactically correct.'
  def crop_image
    image = Image.retrieve crop_parameters[:url]
    cropped_image = image.crop_image(
      crop_parameters[:upper_left_corner],
      crop_parameters[:width],
      crop_parameters[:height]
    )
    send_data(cropped_image, type: image.content_type, disposition: 'inline')
    # See comments in resize_image. The same comments about Cache-Control Header
    # caching and database caching apply here as well.
    expires_in cache_expiration_time, public: true
  end

  api :GET, 'images/resize_image', 'Request a resized image.'
  description <<-EOS
    This endpoint is used to resize an image whose url is provided. This call requires
    a url, a new width, and a new height. Upon successful completion, a resized image
    with the requested properties will be sent back to the user.
  EOS
  param :url, ImageShop::Regexp.uri, desc: 'A url for the image to be resized. This url should be sent in url-encoded format.', required: true
  param :width, ImageShop::Regexp.positive_integer, desc: 'The width of the new resized image.', required: true
  param :height, ImageShop::Regexp.positive_integer, desc: 'The height of the new resized image.', required: true
  error 400, 'Bad Request. Please check that all parameters were provided and that the request is syntactically correct.'
  def resize_image
    image = Image.retrieve resize_parameters[:url]
    resized_image = image.resize_image(
      resize_parameters[:width],
      resize_parameters[:height]
    )
    send_data(resized_image, type: image.content_type, disposition: 'inline')
    # The global cache was set to public with an expiration time of 1 minute.
    # This is done through the Cache-Control Header. The timespan chosen
    # is to facillitate testing. In practice, we would likely use a slightly
    # longer value. However, this value should be an order of magnitude smaller
    # than the database caching time. The database caching time is set to 5
    # minutes to facillitate testing. In practice, the refetch time for the
    # database would also be longer and an order of magnitude longer than the
    # CDN caching time. This is to minimize CDN usage and cost. Since CDN caching
    # is based on url and parameter values. Furthermore, CDN storage is more
    # expensive than database storage.
    expires_in cache_expiration_time, public: true
  end

    # Private methods are indented an additional two spaces to easily
    # distinguish between public and private methods.
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
        upper_left_corner: [:x, :y]
      )
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet,
    # only allow the white list through.
    def image_params
      params.require(:image).permit(:title)
    end

    def cache_expiration_time
      @cache_expiration_time ||= Rails.application.config.cache_control_expiration_time
    end
end
