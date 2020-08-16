class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        user = User.create(params)
        session[:user_id]= user.id
        redirect '/lists'
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