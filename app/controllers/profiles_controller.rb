class ProfilesController < ApplicationController
  def index
    # Stores all profiles into @profiles

    @profiles = Profile.all
  end

  def create
    # Creates a new profile

    if Profile.new(profile_params).valid?
      # If profile params are valid, save to the db
      @profile = Profile.new(profile_params)
      @profile.save
      # Redirects to the new profile
      redirect_to profile_products_path(@profile.id)
    else
      # If profile params are NOT valid, redirects to the root path
      flash[:danger] = "Profile name is invalid, too big or is not unique."
      return redirect_to root_path
    end
  end

  def update
    # Should update an existing profile

    # Stores the profile which will be updated into @profile
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      # If the profile has been updated
      flash[:success] = "Profile updated successfully."
    else
      # If the profile has NOT been updated
      flash[:danger] = "Profile name is invalid, too big or is not unique."
    end

    # Redirects to the profile
    redirect_to profile_products_path(@profile)
  end

  def destroy
    # Should destroy a profile and all its products

    # Stores the profile which will be destroyed
    @profile = Profile.find(params[:id])
    # Destroys @profile
    @profile.destroy

    # Redirects to the root path
    flash[:success] = "The profile and all its products have been deleted."
    redirect_to root_path
  end

  private
    def profile_params
      # There is only one param permitted
      # :profile_name
      params.require(:profile).permit(:profile_name)
    end
end
