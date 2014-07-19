class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [ :create]
  def create
  	@comment = Comment.new(comment_params.merge(:user_id=>current_user.id.to_i))
  	#if @comment.save
    # redirect_to article_path(@comment.article), notice: 'Komentarz dodany'
    #else
     # redirect_to article_path(@comment.article), alert: 'Blad przy dodawaniu komentarza'
    #end
    @comment.save
    #ajax nie dziala, mimo ze wszystko jest tak samo jak innym moim projekcie, w ktorym ajax dziala: https://github.com/reynevan/rails_ajax
    respond_to do |format|
      format.html {redirect_to article_path(@comment.article) }
      format.js {}
    end
  end


  private
	def comment_params
      params.require(:comment).permit(:article_id, :content, :user_id)
    end
end
