class ArticlesController < ApplicationController
  before_action :find_article, only:[:show, :edit, :update, :destroy]
  
  def show
  end 
    
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(art_params)
    @article.user = User.first
    if @article.save
      flash[:notice]="Article Created Successfully"
      redirect_to @article
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    if @article.update(art_params)
      flash[:notice] = "Article Updated Successfully"
      redirect_to @article
    else
      render "new", status: :unprocessable_entity
    end

  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end


  private
    
    def find_article
      @article = Article.find(params[:id])
    end

    def art_params
      params.require(:article).permit(:title, :body)
    end
end
