require 'rails_helper'

describe MoviesController, :type => :controller do
    describe "GET #index" do
        it "creates list of movies" do
            movie = FactoryGirl.create(:movie)
            get :index
            expect(assigns(:movies)).to eq([movie])
        end
        
        it "renders index view" do
            get :index
            expect(response).to render_template(:index)
        end
    end
    
    describe "GET #show" do
        it "assigns the correct movie" do
            movie = FactoryGirl.create(:movie)
            get :show, id: movie
            expect(assigns(:movie)).to eq(movie)
        end
        it "renders the :show template" do
            get :show, id: FactoryGirl.create(:movie)
            expect(response).to render_template(:show)
        end
    end
    
    describe "GET #create" do
        context "create movie with correct input" do
            it "saves movie to database" do
                post :create, movie: FactoryGirl.attributes_for(:movie)
                expect(Movie.count).to eq(1)
            end
            it "redirects to the movies path" do
              post :create, movie: FactoryGirl.attributes_for(:movie)
              expect(response).to redirect_to(movies_path)
            end
        end
    end
    
    describe "GET #edit" do
        it "renders the :edit template" do
            get :edit, id: FactoryGirl.create(:movie)
            expect(response).to render_template(:edit)
        end
        it "assigns the correct movie" do
            movie = FactoryGirl.create(:movie)
            get :edit, id: movie
            expect(assigns(:movie)).to eq(movie)
        end
    end
    
    describe "GET #showsame" do
       it "should call same_director_movies method" do
           movie = FactoryGirl.create(:movie, title: 'Tangled')
           expect(Movie).to receive(:same_director_movies)
           get :showsame, { id: movie }
       end
       it "redirect to home page when no director is found" do
           movie = FactoryGirl.create(:movie, title: 'Tangled')
           Movie.stub(:same_director_movies).with(nil).and_return(nil)
           get :showsame, { id: movie }
           expect(response).to redirect_to(root_url)
       end 
    end
    
    describe "GET #update" do
        it "assigns the correct movie" do
            movie = FactoryGirl.create(:movie)
            get :edit, id: movie
            expect(assigns(:movie)).to eq(movie)
        end
        it "updates movie title correctly" do
            movie = FactoryGirl.create(:movie)
            put :update, id: movie.id, movie: FactoryGirl.attributes_for(:movie, title: 'updated title')
            movie.reload
            expect(movie.title).to eql('updated title')
        end
        it "updates movie rating correctly" do
            movie = FactoryGirl.create(:movie, rating: 'PG')
            put :update, id: movie.id, movie: FactoryGirl.attributes_for(:movie, rating: 'R')
            movie.reload
            expect(movie.rating).to eql('R')
        end
        it "updates movie director correctly" do
            movie = FactoryGirl.create(:movie, director: 'old director')
            put :update, id: movie.id, movie: FactoryGirl.attributes_for(:movie, director: 'new director')
            movie.reload
            expect(movie.director).to eql('new director')
        end
        it "updates movie director correctly" do
            movie = FactoryGirl.create(:movie, director: 'old director')
            put :update, id: movie.id, movie: FactoryGirl.attributes_for(:movie, director: 'new director')
            movie.reload
            expect(movie.director).to eql('new director')
        end
        it "updates movie description correctly" do
            movie = FactoryGirl.create(:movie, description: 'old description')
            put :update, id: movie.id, movie: FactoryGirl.attributes_for(:movie, description: 'new description')
            movie.reload
            expect(movie.description).to eql('new description')
        end
        it "redirects to updated movie page" do
            movie = FactoryGirl.create(:movie)
            put :update, id: movie.id, movie: FactoryGirl.attributes_for(:movie, title: 'updated title')
            expect(response).to redirect_to(movie_path(movie))
        end
    end
    
    describe "GET #destroy" do
        it "deletes movie from database" do
            movie = FactoryGirl.create(:movie)
            delete :destroy, id: movie
            expect(Movie.count).to eq(0)
        end
        it "redirects to the movies path" do
          movie = FactoryGirl.create(:movie)
          delete :destroy, id: movie
          expect(response).to redirect_to(movies_path)
        end
    end
  
end