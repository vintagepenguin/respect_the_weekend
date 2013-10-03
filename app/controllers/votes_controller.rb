class VotesController < ApplicationBase 
  def create
    if current_user 
      @event = Event.find_by_id(params[:id])
      vote = @event.votes.create(user_id: current_user.id)
      redirect_to root_url
    else 
      flash[:notice] = "You need to login to vote"
      redirect_to root_url
    end 
  end 
end 