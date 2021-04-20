
require 'json'
require 'open-uri'


p "destroy all movies"
Movie.destroy_all
p "db is clean!"
p "create movies"

filepath = "http://tmdb.lewagon.com/movie/top_rated"

top_movies = URI.open(filepath).read

movies = JSON.parse(top_movies)

movies["results"].each do |top_movie|
  Movie.create!(
    title: top_movie["original_title"],
    overview: top_movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/original#{top_movie["backdrop_path"]}",
    rating: top_movie["vote_average"]
  )
  p "added a movie"
end

p "movies created!"