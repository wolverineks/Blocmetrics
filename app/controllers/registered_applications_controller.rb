class RegisteredApplicationsController < ApplicationController

  def new
    @registered_application = RegisteredApplication.new
    @user = current_user
    authorize @registered_application
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
    authorize @registered_application
    @events = @registered_application.events.group_by(&:name)
  end

  def edit
    @registered_application = RegisteredApplication.find(params[:id])
    @user = current_user
    authorize @registered_application
  end

  def create
    @registered_application = current_user.registered_applications.build(registered_application_params)
    authorize @registered_application
    if @registered_application.save
      redirect_to registered_application_path(@registered_application), notice: "Application was saved successfully."
    else
      flash[:error] = "There was an error creating the Application. Please try again."
      render :new
    end
  end

  def update
    @registered_application = RegisteredApplication.find(params[:id])
    authorize @registered_application
    if @registered_application.update_attributes(registered_application_params)
      redirect_to registered_application_path
    else
      flash[:error] = "There was an error updating the application. Please try again."
      render :edit
    end
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])
    @user = @registered_application.user
    authorize @registered_application
    
    if @registered_application.destroy
      flash[:notice] = "\"#{@registered_application.name}\" was deleted."
      redirect_to user_path(@user)
    else
      flash[:error] = "There was an error deleting the application. Please try again."
      render :show
    end
  end

private

  def registered_application_params
    params.require(:registered_application).permit(:name, :url)
  end

end
