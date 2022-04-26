class ProfilesController < ApplicationController
  def new 
    @profile = Profile.new
  end

  def create 
    @profile = Profile.new(profile_params)

    if @profile.save 
      redirect_to user_path(current_user.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit 
    user = User.find(params[:id])
    @profile = user.profile
  end

  def update 
    user = User.find(params[:id])
    @profile = user.profile 

    if @profile.update(profile_params)
      redirect_to user_path(current_user.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private 

  def profile_params 
    params.require(:profile).permit(:first_name, :last_name, :birth_day, :self_describe, :user_id)
  end
end
