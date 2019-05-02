class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :show]

  def new
    @gossip = Gossip.new
    @comment = Comment.new
  end

  def create
    @gossip = Gossip.new('title' => params[:title], 'content' => params[:content], 'user_id' => current_user.id)

    if @gossip.save
      puts "The super potin was succesfully saved !"
      redirect_to '/'
    else
      puts "Error : you need to complete this field / the title must be at least 3 characters longue / etc."
      render '/gossips/new'
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
    # if current_user != @gossip.user_id
    #   render edit_gossip_path
    # end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end

  def index
    @gossip = Gossip.all
    @comment_count = Comment.group(:gossip_id).count
  end

  def show
    @gossip = Gossip.find(params[:id])
    @comment = Comment.where('gossip_id': @gossip.id)
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
end
