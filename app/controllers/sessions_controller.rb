class SessionsController < ApplicationController
    
    def new
    end
    
    def create
        @user = User.find_by(name: params[:user][:name])
        authenticated = @user.try(:authenticate, params[:user][:password])
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to controller: 'users', action: 'show'
        else
            return head(:forbidden)
            redirect_to controller: 'sessions', action: 'new'
        end
    end
end