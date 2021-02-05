class ArticlesController < ApplicationController
	include ArticlesHelper

	before_action :require_login, except: [:index, :show]

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])

		@comment = Comment.new
		@comment.article_id = @article.id
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@article.save

		flash.notice = "Article '#{@article.title}' Created!"

		redirect_to article_path(@article)
	end

	def destroy
		title = Article.find(params[:id]).title
		Article.find(params[:id]).destroy

		flash.notice = "Article '#{title}' Destroyed!"

		redirect_to articles_path
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "Article '#{@article.title}' Updated!"

		redirect_to article_path(@article)
	end

	def archived
		@article = Article.find(params[:article_id])
		@article.archived = !@article.archived
		@article.save

	 	flash.notice = "Article '#{@article.title}' Archived!"

	 	redirect_to articles_path
	 end

end
