class ListsController < ApplicationController

    get '/lists' do
        login_required
        session[:message] = "Welcome back!"
        @lists = current_user.lists                           # index action: when this route(get 
        erb :'lists/index'
    end                                         # request) is hit, look up all the 
                                                  # items that correspond to the current user. 
                                                     # Then directs to the erb where it is told to render that "view".
    get '/lists/new' do  
        login_required                              # new action/ view 
        erb :'lists/new'
    end

    post '/lists' do                                 # create action used by new.erb
        list = current_user.lists.build(params)
        if list.save
          redirect "lists/#{list.id}"
        else
          erb :'lists/new'
        end                   
    end

    get '/lists/:id' do    
        login_required
        if set_list                     #show action 
            erb :'lists/show'
        else
            redirect '/lists'
        end
    end 

    get '/lists/:id/edit' do
        det_list
        erb :'lists/edit'
    end

    patch '/lists/:id' do 
        params.delete(:_method)                         #update action to lists/items/user
        set_list
        @list.update(params)
        redirect '/lists'
    end

    delete '/lists/:id' do
        @lists.destroy if set_list
        redirect '/lists'
    end



    private

    def set_list
        @list = current_user.lists.find_by_id(params[:id])
    end
end