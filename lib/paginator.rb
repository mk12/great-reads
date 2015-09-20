class Paginator
  attr_reader :chars_per_page, :num_pages

  DEFAULT_CHARS = 1100

  def initialize(filename, chars_per_page=DEFAULT_CHARS)
    @path = File.join(Rails.root, 'db', 'data', filename)
    @chars_per_page = chars_per_page
    @num_pages = File.size(@path) / @chars_per_page
  end

  def text(page)
    f = File.open(@path)
    offset = (page - 1) * @chars_per_page - 1
    unless offset < 0
      f.seek(offset)
      if f.getc.blank?
        f.seek(1, IO::SEEK_CUR)
      else
        while f.getc.present?
          f.seek(1, IO::SEEK_CUR)
        end
      end
    end

    out = f.read(@chars_per_page)
    while (c = f.getc).present?
      out << c
    end

    out
  end

  def close
    @file.close
  end
end
