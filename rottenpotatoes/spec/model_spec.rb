require 'rails_helper'


describe Movie do

    describe '.find_with_same_director' do
        
        context 'movie has a director' do
            it 'finds movies with same director' do
                movie1 = FactoryGirl.create(:movie, title: 'Ratatouille', rating: 'G', director: 'Brad Bird')
                movie2 = FactoryGirl.create(:movie, title: 'Incredibles', rating: 'PG', director: 'Brad Bird')
                movie3 = FactoryGirl.create(:movie, title: 'Up', rating: 'PG', director: 'Pete Doctor')
                movie4 = FactoryGirl.create(:movie, title: 'Tangled', rating: 'PG')
                
                expect(Movie.same_director_movies(movie1.director)).to match_array(["Ratatouille","Incredibles"])
                expect(Movie.same_director_movies(movie3.director)).to match_array(['Up'])
            end
            it 'doesnt include movies with different director' do
                movie1 = FactoryGirl.create(:movie, title: 'Ratatouille', rating: 'G', director: 'Brad Bird')
                movie2 = FactoryGirl.create(:movie, title: 'Incredibles', rating: 'PG', director: 'Brad Bird')
                movie3 = FactoryGirl.create(:movie, title: 'Up', rating: 'PG', director: 'Pete Doctor')
                movie4 = FactoryGirl.create(:movie, title: 'Tangled', rating: 'PG')
                
                expect(Movie.same_director_movies(movie1.director)).to_not include(['Up'])
                expect(Movie.same_director_movies(movie3.director)).to_not include(['Ratatouille', 'Incredibles'])
            end
        end
        
         context 'movie has no director' do
            it 'returns nil for sad path' do
                movie1 = FactoryGirl.create(:movie, title: 'Ratatouille', rating: 'G', director: 'Brad Bird')
                movie2 = FactoryGirl.create(:movie, title: 'Incredibles', rating: 'PG', director: 'Brad Bird')
                movie3 = FactoryGirl.create(:movie, title: 'Up', rating: 'PG', director: 'Pete Doctor')
                movie4 = FactoryGirl.create(:movie, title: 'Tangled', rating: 'PG')
                expect(Movie.same_director_movies(movie4.director)).to equal(nil)
            end
        end
    end
end