class ListsController < ApplicationController

    get '/lists' do
        @lists = current_user.lists.all                            # index action: when this route(get 
        erb :'lists/index'                           # request) is hit, look up all the 
    end                                              # items that correspond to the current user. 
                                                     # Then directs to the erb where it is told to render that "view".
    get '/lists/new' do                              # new action/ view for form to create new items for the user
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

    get '/lists/:id' do                               #show action 
        @list = List.find_by_id(params[:id])
        erb :'lists/edit'
    end 

    patch '/lists/:id' do 
        params.delete(:_method)
        @list = :List.find_by_id(params[:id])
        @list.update(params)
        redirect '/lists'
    end


end