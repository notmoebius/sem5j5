class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @point_comment = Gossip.find(params[:id])
    puts "$" * 60
    puts params[:id]
    puts @point_comment.inspect
    puts "$" * 60
  end

  def create
    @comment = Comment.new('gossip_id' => @point_comment, 'content' => params[:content], user_id: '1')

    puts "*" * 60
    puts @comment.inspect
    puts "*" * 60

    if @comment.save
      puts "The super potin was succesfully saved !"
      redirect_to '/gossip/#{:id}'
    else
      puts "Error : you need to complete this field / the title must be at least 3 characters longue / etc."
      render'/comments/new'
    end
  end

  def update
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def destroy
  end

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end
end
