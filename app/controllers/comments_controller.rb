class CommentsController < ApplicationController
  def create
    @card = Card.find(params[:card_id])
    @comment = @card.comments.new(comment_params)

    if @comment.save
      redirect_to @card
    else
      render 'cards/show'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to comment.card
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
