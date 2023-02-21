class RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Redirect to the appropriate page after successful sign up
      redirect_to root_path, notice: 'Your account was successfully created.'
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update  
    @user = current_user
    if @user.update_without_password(user_params)
      @user.profile_image = params[:user][:profile_image]
      @user.save
      redirect_to root_path, notice: 'Your profile was successfully updated.'
    else
      render :edit
    end

  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :acc_type, :phone, :profile_image)
  end
end
