class ProfilesController < ApplicationController
  # TODO comment this controller

  def index
    @profiles = Profile.all
  end

  def create
    # Creates a new profile
    if Profile.new(profile_params).valid?
      @profile = Profile.new(profile_params)
      @profile.save
      redirect_to profile_products_path(@profile.id)
    else
      flash[:danger] = "Profile name is invalid, too big or is not unique."
      return redirect_to root_path
    end
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      flash[:success] = "Profile updated successfully."
    else
      flash[:danger] = "Profile name is invalid, too big or is not unique."
    end
    
    redirect_to profile_products_path(@profile)
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy

    flash[:success] = "The profile and all its products have been deleted."
    redirect_to root_path
  end

  private
    def profile_params
      params.require(:profile).permit(:profile_name)
    end
end
