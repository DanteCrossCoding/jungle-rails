class SessionsController < ApplicationController

  def new
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # if user is authenticated, sets session cookie to keep them logged in
        session[:user_id] = user.id
        redirect_to '/'
      else
      # if user is not authenticated, redirects to login
        redirect_to '/login'
      end
    end

    # deletes cookie on logout
  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
