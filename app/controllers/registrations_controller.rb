class RegistrationsController < Devise::RegistrationsController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      @user.profile_image = params[:user][:profile_image]
      byebug
      @user.save
      redirect_to root_path, notice: 'Your profile was successfully updatedddddddddddddddd.'
    else
      render :edit
    end

  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :phone, :profile_image)
  end
end
