class ArticlesController < ApplicationController
  before_action :find_article, only:[:show, :edit, :update, :destroy]
  before_action :require_user, except:[:show, :index]
  before_action :require_same_user, only:[:edit, :update, :destroy]
  
  def show
  end 
    
  def index
    @articles = Article.paginate(page: params[:page], per_page: 4)

  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(art_params)
    @article.user = current_user
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

    def require_same_user
      if current_user != @article.user && !current_user.admin?
        flash[:alert] = "You can only Edit, Update, or Delete your own Article"
        redirect_to @article
      end
    end
end
