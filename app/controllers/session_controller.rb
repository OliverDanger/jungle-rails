class SessionController < ApplicationController
  def new
  end

  # verify user on login
  def authenticate_with_credentials( email, password)
    email.downcase
    user = User.find_by_email(email)
    if user
      return user.authenticate(password)
    end
    return nil
  end

  def create
    user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if authenticate_with_credentials( params[:email], params[:password] )
      # Save the user id inside the browser cookie.
      session[:user_id] = user.id
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to '/login'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/login'
  end

end