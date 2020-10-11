class PrototypesController < ApplicationController
  before_action :move_to_index,{only: [:edit,:update,:destroy]}
  def index
   @prototypes = Prototype.all
  end
  
  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
     redirect_to user_session_path
    else
     redirect_to new_prototype_path
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to user_session_path
  end

  def update
    prototype = Prototype.find(params[:id])
    prototype.update(prototype_params)
    if prototype.update(prototype_params)
      redirect_to prototype_path(prototype.id)
    else 
      redirect_to edit_prototype_path
    end
  end
  
  
  private

  def prototype_params
    params.require(:prototype).permit(:conept, :image, :title, :catch_copy).merge(user_id: current_user.id)
  end

  def move_to_index
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
    unless current_user.id == @prototype.user_id
      redirect_to action: :index
    end
    end

end
