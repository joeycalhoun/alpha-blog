class PagesController < ApplicationController
   def home
       redirect_to articles_path if logged_in?
   end 
   def about
       
   end
   
   def search
      @search_term = params[:search]
      @articles =Article.where("title LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
      @users = User.where("username LIKE ? OR email LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
      @categories = Category.where("name LIKE ?", "%#{params[:search]}%")
   end
end