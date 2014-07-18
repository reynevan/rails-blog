class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :edit, :updates]
  before_action :is_mine?, only: [:edit, :update]
  def new
    if @article.nil?
      @article = Article.new
    end
  end

  def create
    @article = Article.create(article_params.merge(:user_id=>current_user.id.to_i))
    if @article.save
  	  redirect_to articles_path, notice: 'Post dodany'
  	else
  	  render 'new', alert: 'Blad przy dodawaniu posta'
  	end
  end

  def show
  	@article = Article.find(params[:id])
  	@comments = @article.comments
  	@comment = Comment.new
  end

  def index
  	@articles = Article.all
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, notice: 'Post usuniety'
  end

  def edit
  	@article = Article.find(params[:id])
    unless @article.user.id == current_user.id
      redirect_to articles_path, alert: 'Nie mozesz edytowac nie swojego posta'
    end
  end

  def update
  	@article = Article.find(params[:id])
  	if @article.update(article_params)
  		redirect_to articles_path, notice: 'Zmieniono post'
  	else
      render 'edit'
  	end
  end
  private

  def article_params
    params[:user_id]=current_user.id
    params.require(:article).permit(:title, :content)
  end
  def is_mine?
    if current_user.id == params[:id]
      true
    end
  end
end
