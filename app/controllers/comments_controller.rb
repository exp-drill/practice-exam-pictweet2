class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/tweets/#{comment.tweet.id}"   #コメントと結びつくツイートの詳細画面に遷移する
  end

  private
  def comment_params
    binding.pry
    params.require(:comment).permit(:text, :tweet_id).merge(user_id: current_user.id)
  end
end
