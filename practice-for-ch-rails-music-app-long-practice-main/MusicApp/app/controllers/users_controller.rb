class UsersController < ApplicationController
    def index 
        @users = User.all
        redirect_to users_url
    end

    def create 
        @user = User.new(username: )
    end

    def show
        @user = User.find(params[:id])
        redirect_to users_url
    end

    def destroy

    end

    def update 

    end
end
