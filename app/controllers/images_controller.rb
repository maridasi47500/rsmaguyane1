class ImagesController < ApplicationController
  before_action :set_image, only: %i[ show edit update destroy eval ]
protect_from_forgery except: [:eval]
layout false, only: [:show]

  # GET /images or /images.json
  def eval
   p "vous etes ici"
   if params['1.x']
    
   p "vous etes ici ok"
     @rate=@image.ratings.create!(rating: 1,member:current_member)
   elsif params['2.x']
   p "vous etes ici ok"
     @rate=@image.ratings.create!(rating: 2,member:current_member)
   elsif params['3.x']
     @rate=@image.ratings.create!(rating: 3,member:current_member)
   p "vous etes ici ok"
   elsif params['4.x']
   p "vous etes ici ok"
     @rate=@image.ratings.create!(rating: 4,member:current_member)
   elsif params['5.x']
   p "vous etes ici ok"
     @rate=@image.ratings.create!(rating: 5,member:current_member)
    
   end
   redirect_to @image.category, notice: t("actions.rating.rate", count: @rate.rating,image:@rate.image.id)

  rescue ActiveRecord::RecordInvalid
   redirect_to @image.category, notice: t("actions.rating.alreadyrate")
  end
  def index
    @images = Image.all
  end

  # GET /images/1 or /images/1.json
  def show
@image.addhit

  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images or /images.json
  def create
    @image = Image.new(image_params)

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: "Image was successfully created." }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1 or /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: "Image was successfully updated." }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1 or /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: "Image was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
if params[:idimg]
      @image = Image.find(params[:idimg])
else
      @image = Image.find(params[:id])
    end
    end

    # Only allow a list of trusted parameters through.
    def image_params
      params.require(:image).permit(:title, :image)
    end
end
