class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:index, :new, :create]

    def index
      render :layout => "welcome"
    end

    def new
      render :layout => "login"
    end

    def create
      user = User.find_by(user_name: params[:user][:user_name])
      if user && user.authenticate(params[:user][:password])
        login(user)
        redirect_to user
      elsif !user
        flash[:notice] = "That username does not exist yet."
        redirect_to '/'
      else
        flash[:notice] = user.errors.full_messages
        redirect_to login_path
      end
    end
    
    def verify
    end

    def destroy
      session.delete :user_id
      redirect_to '/'
    end


end


