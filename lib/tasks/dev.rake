namespace :dev do
  desc 'Add some books if they do not already exist'
  task add_books: :environment do
    BOOKS.each do |attributes|
      Book.find_or_create_by(handle: attributes[:handle]) do |book|
        book.update_attributes(attributes)
      end
    end
  end

  desc 'Add readings for each book to a user'
  task add_readings: :environment do
    user = ENV['id'] ? User.find(ENV['id']) : User.first
    Book.find_each do |book|
      user.readings.find_or_create_by(book: book) do |reading|
        reading.current_page = 1
      end
    end
  end
end

def name
  File.open(File.join(Rails.root, 'db', 'data', name)) do |f|
    f.read
  end
end

BOOKS = [
  {handle: 'oliver-twist',
   title: 'Oliver Twist',
   author: 'Charles Dickens',
   filename: 'oliver_twist.md'},
  {handle: 'crime-and-punishment',
   title: 'Crime and Punishment',
   author: 'Fyodor Dostoyevsky',
   filename: 'crime_and_punishment.md'},
  {handle: 'la-chute',
   title: 'La Chute',
   author: 'Albert Camus',
   filename: 'oliver_twist.md'},
  {handle: '1984',
   title: '1984',
   author: 'George Orwell',
   filename: '1984.md'},
  {handle: 'how-to-solve-it',
   title: 'How to Solve It',
   author: 'George Pólya',
   filename: 'oliver_twist.md'},
  { handle: 'the-hobbit',
    title: 'The Hobbit',
    author: 'J.R.R. Tolkien',
    filename: 'oliver_twist.md'},
  {handle: 'the-elements-of-typograhic-style',
   title: 'The Elements of Typographic Style',
   author: 'Robert Bringhurst',
   filename: 'oliver_twist.md'}
]
