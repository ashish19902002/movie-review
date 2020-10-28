desc "Import CSV for movie and review"
require 'import_csv_data.rb'
task import_csv: :environment do
  movie_file = File.open(File.join(Rails.root, 'csv_data', 'movies.csv'))
  ImportCsvData.import_movies(movie_file)
  review_file = File.open(File.join(Rails.root, 'csv_data', 'reviews.csv'))
  ImportCsvData.import_reviews(review_file)
end
