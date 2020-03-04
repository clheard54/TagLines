class SessionsController < ApplicationController
    def index
      render :layout => "welcome"
    end

    def create
      user = User.find_by(user_name: params[:user][:user_name])
      authenticated = user.try(:authenticate, params[:user][:password])
      
       if !authenticated
        flash[:notice] = user.errors.full_messages
        return redirect_to(controller: 'sessions', action: 'new')
       else
        @user = user
        session[:user_id] = @user.id
        redirect_to '/'
       end
    end

    def destroy
      session.delete :user_id
      @user.delete
      redirect_to '/'
    end


end


