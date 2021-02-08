class CommentsController < ApplicationController

	def create
		comment = Comment.new(comment_params)
		comment.article_id = params[:article_id]

		if comment.save
			flash.notice = "Comment successfully saved."
		else
			flash.notice = "Comment failed to post."
		end

		redirect_to article_path(comment.article_id)
	end

private
	
	def comment_params
		params.require(:comment).permit(:author_name, :body)
	end
	
end
