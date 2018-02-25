class TutorialController < ApplicationController
def index
    @tutorials = Tutorial.all
  end

  def view
    @tutorial = Tutorial.find params[:id]
  end

  def queue
    TutorialService.new.delay.scrape_listing
    flash[:message] = 'Scraping queued!'
    redirect_to :action => :index
  end
end
