class BooksController < ApplicationController
  before_action :require_login
  before_action :load_book, only: [:show, :search]

  def index
    @books = current_user.books
  end

  def show
    paginator = Paginator.new(@book.filename)
    @num_pages = paginator.num_pages
    if params[:page]
      @reading.update(current_page: params[:page])
    end
    text = paginator.text(@reading.current_page)
    @html = Rails.application.markdown.render(text)
    @html = Redcarpet::Render::SmartyPants.render(@html)
  end

  def search
  end

  private

  def load_book
    @book = Book.find_by!(handle: params[:id])
    @reading = current_user.readings.find_by(book: @book)
    return render_404 unless @reading
  end
end
