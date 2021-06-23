class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?
def after_sign_in_path_for(resource)
    books_path
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
Refile.secret_key = 'af792bd0d84a6ba580d597393179d96259a1aff18e96b3431e8557bb1cdc67e38615de6220da92403bf062e08d6feae5711db3a989a2c9c399d6db39a4335696'