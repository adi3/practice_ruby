=begin
showGenre action allowed for XSS attack by not escaping user input (from the genre selecting dropdown), and using this input in a raw SQL query to retrieve movies from the database. Injected some SQL in the input posted to showGenre that selected data from the customers table and showed up as movie data. Parsed the response HTML for relevant CC details.
Fixed security loophole by calling one of Rails' metaprogrammed method (find_by_genre) which ensures inputs are all escaped.
=end

class MoviesController < ApplicationController
  def rent
  end
  
  def selectGenre
  end

  def showGenre
    if !request.post? then
      raise "Wrong HTTP method; must be POST"
    end
    if request.xhr? then
      raise "Cannot invoke this URL via Ajax"
    end
    if request.content_type != "application/x-www-form-urlencoded" then
      raise "Illegal request: must specify Content-Type header " +
          "as application/x-www-form-urlencoded"
    end
    if !verified_request? then
      raise "Potential CSRF attack: invalid authenticity token"
    end 
    genre = params[:genre]
    if genre == "All" then
      @movies = Movie.find(:all)
    else
      @movies = Movie.find_by_genre(genre)
    end
  end

end
