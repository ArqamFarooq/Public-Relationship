class UsersController < ApplicationController
    
    @user = current_user
    if @user.update_without_password(user_params)
      @user.profile_image = params[:user][:profile_image]
      @user.save
      redirect_to root_path, notice: 'Your profile was successfully updated.'
    else
      render :edit
    end

    private 

    def user_params
        params.permit(:email, :password, :password_confirmation, :current_password, :name, :profile_image)
      end
end
