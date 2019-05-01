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
    @gossip = Gossip.find(params[:id])
    if @gossip.update('title' => params[:title], 'content' => params[:content], 'user_id' => @gossip.user_id)
      redirect_to @gossip
    else
      render :edit
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end

  def index
    @gossip = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end
end
