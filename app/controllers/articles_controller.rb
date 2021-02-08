class ArticlesController < ApplicationController
	include ArticlesHelper

	before_action :require_login, except: [:index, :show]

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])

		@comment = Comment.new
		@comment.article = @article
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@article.author = current_user

		if @article.save 
			flash.notice = "Article '#{@article.title}' Created!"
			ArticleMailer.new_article(@article).deliver_now
			redirect_to article_path(@article)
		else
			flash.notice = "Article #{@article.title} was not Created!"
			redirect_to articles_path
		end

	end

	def destroy
		article = Article.find(params[:id])

		if article.destroy
			flash.notice = "Article '#{article.title}' Destroyed!"
			redirect_to articles_path
		else 
			flash.notice = "Article #{article.title} not Destroyed!"
			redirect_to article
		end

	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		if !Article.find(params[:id]).update(article_params)
			flash.notice = "Article Updated!"
			# redirect_to article_path
		else
			flash.notice = "Article not Updated!"
			# redirect_to edit_article_path
		end

		redirect_to article_path
	end

	def archived		
		archive_article

	 	redirect_to articles_path
	end

private

	def archive_article
		article = Article.find(params[:article_id])
    	article.archived = !article.archived
    	# article.update(:archived, true)
    	if article.save		
    		if article.archived
	 			flash.notice = "Article Archived!"
	 			ArticleMailer.archived_article(article).deliver_now
	 		else
	 			flash.notice = "Article Drafted!"
	 		end
	 	else
	 		flash.notice = "Article not Archived!"
	 	end
	end

	#helper_method :archive_article

end
