def read_file(name)
  File.open(File.join(Rails.root, 'db', 'data', name)) do |f|
    f.read
  end
end

Book.create!(
  handle: 'oliver-twist',
  title: 'Oliver Twist',
  author: 'Charles Dickens',
  content: read_file('oliver_twist.html')
)
Book.create!(
  handle: 'crime-and-punishment',
  title: 'Crime and Punishment',
  author: 'Fyodor Dostoyevsky',
  content: read_file('oliver_twist.html')
)
