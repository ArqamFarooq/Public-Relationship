class UsersController < ApplicationController
  before_action :set_user

  def show
  end
    
  def edit
    @user = current_user
    redirect_to action: 'show', id: @user.id
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
        params.require(:user).permit(:email,:first_name, :last_name, :phone, :acc_type, :password, :password_confirmation, :current_password, :name, :profile_image)
    end

    def set_user
      @user = User.find_by(id: params[:id])
    end
end

