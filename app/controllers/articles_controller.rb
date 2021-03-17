class ArticlesController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  
  def show
  end

  def index
    @article= Article.all
  end
  
  def new
    @article = Article.new
  end

  def create
    @article= Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice]= "Article was created successfully"
      redirect_to @article
    else
      render 'new'
    end
    
  end
  
  def edit
  end
  
  def update
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice]= "Article was update successfully"
      redirect_to article_path    
    else
      render 'edit'
    end
  end
  
  def destroy
    @article.destroy
    redirect_to articles_path
  end

end

private

def find_user
  @article= Article.find(
    params[:id]
    )
end