class ArticlesController < ApplicationController
	include ArticlesHelper
	before_filter :require_login, except: [:index, :show]
	def index
		@articles = Article.all 
	end
	def show
		@article = Article.find(params[:id])
		@comment = Comment.new
		@comment.article_id = @article_id
	end
	def new
		@article = Article.new
	end
	def create
		@article = Article.new(article_params)
		@article.save
		flash.notice = "Article #{@article.title} was created."
		redirect_to article_path(@article)
	end
	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		update_tags
		flash.notice = "Article #{@article.title} was deleted."
		redirect_to action: :index
	end
	def edit
		@article = Article.find(params[:id])
	end
	def update
		@article = Article.find(params[:id])
		@article.update(article_params)
		update_tags
		flash.notice = "Article #{@article.title} was updated."
		redirect_to article_path(@article)
	end
	private
	def update_tags
		@tags = Tag.all
		@tags.each do |tag| #updating tag list by deleting tags that arent associated with articles
			if tag.articles.empty? then tag.destroy end
		end
	end
end
