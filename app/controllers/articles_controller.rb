class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new 
  end

  def create
    @article = Article.new(art_params)

    if @article.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id]) 
  end

  def update
  
    @article = Article.find(params[:id])
    
    if @article.update(art_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end


  private

  def art_params
        params.require(:article).permit(:title, :author, :body)
  end

end
