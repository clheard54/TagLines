class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authorized
    helper_method :current_user
  
    def login(user)
      session[:user_id] = user.id
    end

    def current_user
      @user = User.find_by(id: session[:user_id])
    end
  
    def logged_in?
      !!current_user
    end
  
    def authorized
      unless logged_in?
      flash[:notice] = "You must be logged in to see this page"
      redirect_to login_path
      end
    end
  end
