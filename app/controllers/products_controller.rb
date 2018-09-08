class ProductsController < ApplicationController
  # TODO comment the JavaScript for products controller (products.coffee)
  # TODO comment the Stylesheets for products controller (products.scss)

  def index
    # Store all products into @products by created_at descending order
    profile_valid?(params[:profile_id])
    @products = Product.where(:profile_id => @profile.id).order(created_at: :desc)
  end

  def create
    # Creates a new product
    if Product.new(product_params_create).valid?
      # Save to the database if the params go with the Active Record Validations (see models/product.rb)
      @product = Product.new(product_params_create)
      # Uncomment the next line to check the passed parameters
      # return render plain: @product.inspect
      @product.last_progresses = {"#{Time.now.strftime('%Y-%m-%d %H:%M:%S')}": "0.0"}
      @product.save
      flash[:success] = "Product added successfully."
      set_product_id_session(@product.id)
    else
      # Couldn't save the product
      flash[:danger] = "Your input isn't valid. Try again."
    end

    # Redirects back
    redirect_to profile_products_path(params[:profile_id])
  end

  def show
    @product = Product.find(params[:id])

    profile_valid?(params[:profile_id])

    current_day_num = Time.now.strftime("%w")
    weekdays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    days_labels = [
      "#{weekdays[current_day_num.to_i-6]}",
      "#{weekdays[current_day_num.to_i-5]}",
      "#{weekdays[current_day_num.to_i-4]}",
      "#{weekdays[current_day_num.to_i-3]}",
      "#{weekdays[current_day_num.to_i-2]}",
      "#{weekdays[current_day_num.to_i-1]}",
      "#{weekdays[current_day_num.to_i]}"
    ]

    current_month_num = Time.now.strftime("%-m").to_i - 1
    months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    months_labels = [
      "#{months[current_month_num.to_i-6]}",
      "#{months[current_month_num.to_i-5]}",
      "#{months[current_month_num.to_i-4]}",
      "#{months[current_month_num.to_i-3]}",
      "#{months[current_month_num.to_i-2]}",
      "#{months[current_month_num.to_i-1]}",
      "#{months[current_month_num.to_i]}"
    ]

    @data_by_days = {
      labels: days_labels,
      datasets: [
        {
          label: "Progress by day",
          backgroundColor: "transparent",
          borderColor: "rgba(52, 58, 64, 1)",
          data: [162, 167, 171, 178, 189, 193, 200]
        }
      ]
    }

    @data_by_months = {
      labels: months_labels,
      datasets: [
        {
          label: "Progress by month",
          backgroundColor: "transparent",
          borderColor: "rgba(52, 58, 64, 1)",
          data: [0, 23, 50, 80, 120, 160, 200]
        }
      ]
    }

    @options = {
      width: 100,
      height: 100
    }
  end

  def update
    # Updates the ID's progress

    if update_valid?(params[:id], params[:progress])
      # Security tests from update_valid? passed

      # Retrieve the product from database
      @product = Product.find(params[:id])

      # If progress would be negative, makes it equal to 0
      if params[:progress].to_f < 0
        params[:progress] = 0
      end

      # Try to update progress
      if @product.update(product_params_update)
        if(@product.last_progresses.keys.last[0...10] == "#{Time.now.strftime('%Y-%m-%d')}")
          @product.last_progresses[:"#{Time.now.strftime('%Y-%m-%d %H:%M:%S')}"] = params[:progress]
          if(@product.last_progresses.length > 7)
            @product.last_progresses.delete(@product.last_progresses.keys.first)
          end
          @product.save
        end
        # Success
        flash[:success] = "Product updated successfully."
        set_product_id_session(@product.id)
      else
        # Couldn't update
        flash[:danger] = "There was an error while saving your update."
      end
    else
      # Security tests didn't passed
      flash[:danger] = "Your input isn't valid. Try again."
    end

    # Redirects back
    return redirect_to profile_product_path(params[:profile_id], @product.id)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    flash[:success] = "Product permanently deleted."
    redirect_to profile_products_path(params[:profile_id])
  end

  private
    def product_params_create
      params[:product][:price] = helper.number_with_precision(params[:product][:price], :precision => 2)
      params.require(:product).permit(:name, :price, :url, :profile_id, :progress)
    end

    def product_params_update
      params[:progress] = helper.number_with_precision(params[:progress], :precision => 2)
      params.permit(:progress)
    end

    def helper
      # Includes some "helpful" helpers
      @helper ||= Class.new do
        include ActionView::Helpers::NumberHelper
      end.new
    end

    def update_valid?(id, progress)
      # If id is an integer greater than 0
      if id.to_i > 0
        # If id exists in database
        if Product.exists?(id.to_i)
          return true
        end
      end

      # A test hasn't passed
      return false
    end

    def set_product_id_session(product_id)
      # Sets a session variable containing the updated product id.
      # This variable is gonna be used to show only the updated product's
      # accordion after redirecting, and to manage flash messages according
      # to that accordion.
      session[:product_id] = product_id
    end

    def profile_valid?(profile_id)
      @profiles = Profile.all
      if Profile.exists?(profile_id)
        # If the profile present in the url exists, stores it into @profile variable
        @profile = Profile.find(profile_id)
      else
        # If the profile doesn't exist
        if @profiles.empty?
          # If there is no profile in the database, redirect to root_path with a flash message
          flash[:warning] = "That profile doesn't exist. Think about creating a new one."
          redirect_to root_path
        else
          # If there is at least one profile, stores the first
          @profile = @profiles.first
          flash[:warning] = "That profile doesn't exist. You were redirected to profile \"#{@profile.profile_name}\""
          redirect_to profile_products_path(@profile)
        end
      end
    end
end
