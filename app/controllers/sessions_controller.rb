class SessionsController < ApplicationController

    def new
        @errors = flash[:errors]
    end

    def create
        if !(User.find_by(email: params[:Email])).nil?
            u = User.find_by(email: params[:Email])
            if u.authenticate(params[:Password])
                session[:id] = User.find_by(email: params[:Email]).id
                redirect_to "/users/#{session[:id]}"
            else
                flash[:errors] = ["Invalid Combination"]
                redirect_to "/sessions/new"
            end
        else
            flash[:errors] = ["Invalid Combination"]
            redirect_to "/sessions/new"
        end
        # Log User In
        # if authenticate true
            # save user id to session
            # redirect to users profile page
        # if authenticate false
            # add an error message -> flash[:errors] = ["Invalid"]
            # redirect to login page
    end

    def destroy
        # Log User out
        # set session[:user_id] to null
        # redirect to login page
    end
end
