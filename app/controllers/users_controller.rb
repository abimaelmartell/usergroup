class UsersController < ApplicationController

  before_filter :authenticate_user!, :only => [ :edit, :update ]  

  def show
    @user = User.find params[:id], :include => :posts
  end

  def edit
  end

  def update
    current_user.update_attributes user_params
    redirect_to current_user
  end

private
  def user_params
    params.require( :user ).permit :email,:name,:site_url,:username,:github_url
  end
end
