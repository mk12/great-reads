namespace :dev do
  desc 'Add readings for each book to a user'
  task add_readings: :environment do
    user = ENV['id'] ? User.find(ENV['id']) : User.first
    Book.find_each do |book|
      user.readings.create!(book: book, current_page: 1)
    end
  end
end
