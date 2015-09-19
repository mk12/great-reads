class BooksController < ApplicationController
  before_action :require_login

  def index
    @books = current_user.books
  end

  def show
    @book = Book.find_by!(handle: params[:id])
  end
end
