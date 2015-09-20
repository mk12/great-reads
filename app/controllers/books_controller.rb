class BooksController < ApplicationController
  before_action :require_login
  before_action :load_book, only: [:show, :search]

  def index
    @books = current_user.books
  end

  def show
    paginator = Paginator.new(@book.filename)
    text = paginator.text(params[:page].to_i || 1)
    @html = Rails.application.markdown.render(text)
  end

  private

  def load_book
    @book = Book.find_by!(handle: params[:id])
    @reading = current_user.readings.find_by(book: @book)
    return render_404 unless @reading
  end
end
