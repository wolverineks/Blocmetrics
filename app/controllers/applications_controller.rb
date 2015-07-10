class ApplicationsController < ApplicationController

  def index
    #@applications = Application.visible_to(current_user).paginate(page: params[:page], per_page: 10)
    @applications = Application.all.paginate(page: params[:page], per_page: 10)
    @user = current_user
    #@application = Application.find(params[:id])
    # authorize @applications
  end

  def new
    @application = Application.new
    @user = current_user
    # authorize @application
  end

  def show
    @application = Application.find(params[:id])
    @user = current_user
    @events = @application.events.group_by(&:name)
    # authorize @application
  end

  def edit
    @application = Application.find(params[:id])
    @user = current_user
    # authorize @application
  end

  def create
    @application = current_user.applications.build(application_params)
    # authorize @application
    if @application.save
      redirect_to application_path(@application), notice: "Application was saved successfully."
    else
      flash[:error] = "There was an error creating the Application. Please try again."
      render :new
    end
  end

  def update
    @application = Application.find(params[:id])
    # authorize @application
    if @application.update_attributes(application_params)
      redirect_to application_path
    else
      flash[:error] = "There was an error updating the application. Please try again."
      render :edit
    end
  end

  def destroy
    @application = Application.find(params[:id])
    @user = current_user
    # authorize @application
    
    if @application.destroy
      flash[:notice] = "\"#{@application.name}\" was deleted."
      redirect_to user_path(@user)
    else
      flash[:error] = "There was an error deleting the application. Please try again."
      render :show
    end
  end

private

  def application_params
    params.require(:application).permit(:name, :url)
  end

end
