class UserSessionsController < Devise::OmniauthCallbacksController
  def all
    ## first let's see what we get back from Github
    #render json: request.env["omniauth.auth"].to_json

    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      flash[:notice] = "Signed In!"
      sign_in_and_redirect user
    else
      flash[:alert] = "Problem signing in with provider"
      redirect_to root_url
    end
  end#all
  alias_method :github, :all

  def destroy
    sign_out_all_scopes
    redirect_to root_path, notice: "Signed Out!"
  end
end
