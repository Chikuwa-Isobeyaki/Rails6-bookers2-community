class SearchesController < ApplicationController
  before_action :authenticate_user!
  def search
    @model = params[:model]
    @search = params[:search]
    @word = params[:word]
    
    if @model == 'User'
      @users = User.search_for(@search,@word)
    else
      @books = Book.search_for(@search,@word)
    end
  end
end
