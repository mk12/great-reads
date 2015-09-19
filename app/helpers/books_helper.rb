module BooksHelper
  def cover_info(book)
    "#{book.title}<em>#{book.author}</em>".html_safe
  end
end
