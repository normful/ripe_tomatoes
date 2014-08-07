module UserParams
  extend ActiveSupport::Concern

  private

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation)
  end
end
