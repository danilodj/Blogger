class TagsController < ApplicationController

	def index
		@tags = Tag.all
	end

	def show
		@tag = Tag.find(params[:id])
	end

	def destroy
		name = Tag.find(params[:id]).name
		Tag.find(params[:id]).destroy
		
		flash.notice = "Tag #{name} Destroyed!"

		redirect_to tags_path
	end

end
