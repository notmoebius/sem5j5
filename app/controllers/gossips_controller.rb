class GossipsController < ApplicationController
  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new('title' => params[:title], 'content' => params[:content], user_id: '1')

    if @gossip.save
      puts "The super potin was succesfully saved !"
      redirect_to '/'
    else
      puts "Error : you need to complete this field / the title must be at least 3 characters longue / etc."
      render'/gossips/new'
    end
  end

  def update 
  end

  def edit
  end

  def destroy
  end

  def index
    @gossip = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end
end
