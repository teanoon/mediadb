class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_medium
  before_action :set_article, except: [:index, :new, :create]

  # GET /articles
  # GET /articles.json
  def index
    @articles = params[:includes] == 'all' ? Article.all_with_media_info : @medium.articles.all_with_media_info
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new article_params

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_to_medium
    @medium.add_article @article
    redirect_to medium_articles_path(@medium)
  end

  # TODO publish articles to media.
  def send_to_medium
    @medium.send_article @article
    redirect_to medium_articles_path(@medium)
  end

  def ban_from_medium
    @medium.ban_article @article
    redirect_to medium_articles_path(@medium)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medium
      if params[:medium_id].blank?
        redirect_to media_path, notice: I18n.t('.need_a_medium_to_start')
      end

      @medium = current_user.media.find params[:medium_id]
    end
      
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params[:article].permit(:title, :url, :content)
    end
end
