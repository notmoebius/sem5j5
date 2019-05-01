class CommentsController < ApplicationController
  def new
    #@comment = Comment.new
  end

  def create
    @comment = Comment.new('gossip_id' => params[:gossip_id], 'content' => params[:content], user_id: '1')
    if @comment.save
      puts "The super commentaires was succesfully saved !"
      redirect_to '/'
    else
      puts "Error : you need to complete this field user_id/gossip_id"
      render '/gossips'
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @comment_params = params.permit(:content)
    if @comment.update(@comment_params)
      redirect_to '/'
    else
      render :edit
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to gossips_path
  end

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end
end
