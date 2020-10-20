class SessionsController < ApplicationController
    before_action :require_login, only: [:home, :destroy]
  
    def index
    end

    def login
    end
    
    def new
    end
  
    def create
      user = User.find_by(name: params[:user][:username])
      user = user.try(:authenticate, params[:user][:password])   
      return redirect_to '/sessions/new' unless user
      session[:user_id] = user.id
      redirect_to '/'
    end

    def home
    end
  
    def destroy
      session.delete :user_id
  
      redirect_to '/'
    end

end