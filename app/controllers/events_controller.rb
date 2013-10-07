class EventsController < ApplicationController 
  def index
    @events = Event.all 
  end 

  def new
    @event = Event.new 
  end 

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to root_url
    else 
      flash[:notice] = "Some of your information was incorrect."
      render "new"
    end 
  end

  def show
    @event = Event.find_by_id(params[:id])
  end 

  def edit
    @event = Event.find_by_id(params[:id])
  end 

  def update 
    @event = Event.find_by_id(params[:id])
    if @event.update_attributes(name: params[:event][:name],
                                description: params[:event][:description],
                                address: params[:event][:address],
                                url: params[:event][:url] )
      flash[:notice] = "Successful!!"
      redirect_to event_url(@event)
    else 
      flash[:notice] = 'Editing Event Was Unsuccessful'
      redirect_to :edit 
    end 
  end 

  def destroy
    # NOT WORKING
    @event = Event.find_by_id(params[:event][:id])
  end 

  def add_vote
    if current_user 
      @event = Event.find_by_id(params[:id])
      vote = @event.votes.create(user_id: current_user.id)
      redirect_to root_url
    else 
      flash[:notice] = "You need to login to vote"
      redirect_to root_url
    end 
  end 

  private
 
  def event_params
    params.require(:event).permit(:name, :description, :url,
                                  :start_time, :address, :date)
  end
end 