class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' 
        if logged_in?
            # "Welcome back, you were already logged in!"
        elsif
            params[:user_name] == "" || params[:email] == "" || params[:password] == ""
            # "looks like you missed something?"
            redirect '/signup'
        else
            user = User.create(user_name: params[:user_name], email: params[:email], password: params[:password])
            user.save
            session[:user_id]= user.id
            redirect '/lists'
        end
    end

    get '/login' do 
        erb :'users/login'
    end

    post '/login' do
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/lists'
        else
            @error = ' **username and/or password are incorrect**'
            erb :'/users/login'
        end
    end

    delete '/logout' do
        session.destroy
        erb :welcome
    end
end