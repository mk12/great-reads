class Paginator
  attr_reader :chars_per_page, :num_pages

  DEFAULT_CHARS = 1100

  def initialize(filename, chars_per_page=DEFAULT_CHARS)
    @path = File.join(Rails.root, 'db', 'data', filename)
    @chars_per_page = chars_per_page
    @num_pages = File.size(@path) / @chars_per_page
  end

  def text(page)
    File.open(@path) do |f|
      seek_page_start(f, page)
      read_one_page(f)
    end
  end

  private

  def seek_page_start(f, page)
    offset = (page - 1) * @chars_per_page - 2
    unless offset <= 0
      f.seek(offset)
      newline = f.getc == "\n"
      loop do
        n = f.getc == "\n"
        break if newline && n
        newline = n
      end
    end
  end

  def read_one_page(f)
    out = ""
    while out.size < @chars_per_page
      out << f.gets('')
    end

    out
  end
end
