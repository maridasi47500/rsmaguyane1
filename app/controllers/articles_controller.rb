class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]
protect_from_forgery except: [:destroy]

  # GET /articles or /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show
@article.addhit if params[:preview] != "true"
  end

  # GET /articles/new
  def new
    @article = Article.new(member: current_member)
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to rsmaguyanearticleshow_path(id: @article.id, title: @article.title.parameterize,preview:true), notice: t('messages.article.create') }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to rsmaguyanearticleshow_path(id: @article.id, title: @article.title.parameterize,preview: true), notice: t('messages.article.update') }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to '/rsma-guyane.html', notice: t('messages.article.destroy') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
      if params[:title] && @article.title.parameterize != params[:title]
        redirect_to root_path
      end
    rescue ActiveRecord::RecordNotFound
      redirect_to '/rsma-guyane.html'
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content, :hits, :member_id,:images_attributes=>{})
    end
end
