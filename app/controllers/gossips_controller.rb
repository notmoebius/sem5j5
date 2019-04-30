class GossipsController < ApplicationController
  def new
    @gossips = Gossip.all
  end

  def create
  end

  def update 
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
    @gossip = Gossip.find(params[:id])
  end
end
