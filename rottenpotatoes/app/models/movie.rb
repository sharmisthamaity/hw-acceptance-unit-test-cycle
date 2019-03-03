class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def self.same_director_movies director_name
    same_movie_list = []
    if(director_name.nil?)
      return nil
    elsif (director_name == '')
      return nil
    end
    for m in Movie.all do
      if (m.director == director_name)
        same_movie_list.push(m.title)
      end
    end
    return same_movie_list
  end
end
