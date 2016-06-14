class QuotesController < ApplicationController
  def index
    @quote = Quote.order("RANDOM()").first
    #Takes the entire sheet in the database, randomizing it, and displaying the first one.
  end

  def create
    @quote = Quote.create(quote_params)
    #Reaching out to database and creating a quote with the parameters the user has entered
    if @quote.invalid? 
      flash[:error] = '<strong>Could not save!</strong> The data you entered is invalid.'
    end
    redirect_to root_path
  end

  def about
  end

  private

  def quote_params
    #I'm requiring them to enter information about a quote through a form, but only permit info about a saying and an author
    params.require(:quote) .permit(:saying, :author)
  end

end
