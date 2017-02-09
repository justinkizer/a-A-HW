# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#  yr          :integer
#  score       :float
#  votes       :integer
#  director_id :integer
#
# Table name: castings
#  id          :integer      not null, primary key
#  movie_id    :integer      not null
#  actor_id    :integer      not null
#  ord         :integer

def find_angelina
  Actor.find_by(name: "Angelina Jolie")
end

def top_titles
  Movie.all.select(:id, :title).where("score >= ?", 9)
end

def star_wars
  Movie.all.select(:id, :title, :yr).where("title LIKE 'Star Wars%'")
end

def below_average_years
  Movie.all.select(:yr, "COUNT(*) AS bad_movies").where("score < 5").group(:yr).order("COUNT(*) DESC")
end

def alphabetized_actors
  Actor.all.order(:name).limit(10)
end

def pulp_fiction_actors
  Actor.all.select(:id, :name).distinct.joins(:castings, :movies).where("movies.title = ?", "Pulp Fiction")
end

def uma_movies
  Movie.all.select(:id, :title, :yr).distinct.joins(:castings, :actors).where("actors.name = ?", "Uma Thurman").order(:yr)
end
