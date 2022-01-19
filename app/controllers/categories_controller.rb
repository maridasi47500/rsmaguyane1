class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]
protect_from_forgery except: [:show]
layout false, only: [:images]
  # GET /categories or /categories.json
  def images
  end
  def index
    @categories = Category.all
  end

  # GET /categories/1 or /categories/1.json
  def show
params[:limit]||=20

@images1=@category.allby1(params[:imgordering],params[:limit],params[:page])

if !@images1[params[:page].to_i]
params[:page]=nil
end
    @images = @category.allby(params[:imgordering],params[:limit],params[:page])

  end

  # GET /categories/new
  def new
    @category = Category.new(member: current_member)
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: "Category was successfully created." }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: "Category was successfully updated." }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
if params[:idcat]
      @category = Category.find(params[:idcat])
else
      @category = Category.find(params[:id])
    end
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:title, :member_id,:images_attributes=>{})
    end
end
