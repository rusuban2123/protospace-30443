class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id]) 
    @name = @user.name
    @prototypes = @user.prototypes
    @profile = @user.profile
    @position = @user.position
    @occupation = @user.occupation
    
  end
end
