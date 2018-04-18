class UsersController < ApplicationController
    def new
    end

    def show
        @user = User.find(session[:id])
    end

    def edit
        @user = User.find(session[:id])
    end

    def update
        @user = User.find(session[:id])
        puts @user.name, "____________________________"
        if @user.update(name: params[:Name], email: params[:Email])
            redirect_to "/users/#{session[:id]}"
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to "/users/#{session[:id]}/edit"
        end
    end

    def create
        @user = User.create(name: params[:Name], email: params[:Email], password: params[:Password])
        if @user.save
            session[:id] = User.find_by(email: params[:Email])
            redirect_to "/sessions/new"
        else
            flash[:errors] = ["can't be blank"]
            redirect_to '/users/new'
        end
    end

    def destroy
        User.find(session[:id]).destroy
        redirect_to '/users/new'
    end

end
