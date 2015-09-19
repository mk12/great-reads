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
Book.create!(
  handle: 'la-chute',
  title: 'La Chute',
  author: 'Albert Camus',
  content: read_file('oliver_twist.html')
)
Book.create!(
  handle: '1984',
  title: '1984',
  author: 'George Orwell',
  content: read_file('oliver_twist.html')
)
Book.create!(
  handle: 'how-to-solve-it',
  title: 'How to Solve It',
  author: 'George Pólya',
  content: read_file('oliver_twist.html')
)
Book.create!(
  handle: 'the-hobbit',
  title: 'The Hobbit',
  author: 'J.R.R. Tolkien',
  content: read_file('oliver_twist.html')
)
Book.create!(
  handle: 'the-elements-of-typograhic-style',
  title: 'The Elements of Typographic Style',
  author: 'Robert Bringhurst',
  content: read_file('oliver_twist.html')
)
