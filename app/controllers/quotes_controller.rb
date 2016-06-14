class QuotesController < ApplicationController
  def index
    @quote = Quote.order("RANDOM()").first
    #Takes the entire sheet in the database, randomizing it, and displaying the first one.
  end

#The @ in @quotes (called instance) is required if I want to access that variable in the view, in this case it's index.html.erb
# Quote (not quote in lowercase) is calling the /config/quote.rb file, which we aleady defined in the past. That's the model.

  def create
    @quote = Quote.create(quote_params)
    #Reaching out to database and creating a quote with the parameters the user has entered. quote_params is calling the controller below.
    if @quote.invalid? 
      flash[:error] = '<strong>Could not save!</strong> The data you entered is invalid.'
    end
    redirect_to root_path
  end

  def about
  end

  private #This is private because everything under here is not a page that the user can go to. 

  def quote_params
    #I'm requiring them to enter information about a quote through a form, but only permit info about a saying and an author
    params.require(:quote) .permit(:saying, :author)
  end

end
