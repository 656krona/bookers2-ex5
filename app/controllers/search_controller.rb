class SearchController < ApplicationController
  def search
      @books = Book.all #一覧表示するためにBookモデルの情報を全てくださいのall
      @book = Book.new
    #Viewのformで取得したパラメータをモデルに渡す
    if params[:scope] == "User"
      @users = User.search(params[:search],params[:condition])
    elsif params[:scope] == "Book"
      @books = Book.search(params[:search],params[:condition])
    else
      redirect_back(fallback_location: users_path)
    end
  end

end
