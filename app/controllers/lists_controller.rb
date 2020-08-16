class ListsController < ApplicationController

    get '/lists' do
        login_required
        session[:message] = "Welcome back!"
        @lists = current_user.lists                           # index action: when this route(get 
        erb :'lists/index'
    end                               
    
    get '/lists/new' do  
        login_required                              # new action/ view 
        erb :'lists/new'
    end

    post '/lists' do                                 # create action used by new.erb/ feeds the 'get' /lists/new 
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
            redirect '/lists/show'
        end
    end 

    get '/lists/:id/edit' do
        login_required
        set_list                                           #update
        erb :'lists/edit'
    end

    patch '/lists/:id' do 
        @list = List.find_by_id(params[:id])
        @list = params[:id]
        #params.delete(:_method)                         #update 
        set_list
        @list.delete(params)
        @list.save
        redirect "/lists/show/#{@list.id}"
    end

    
    delete '/lists/:id' do                      #delete action
        if login_required
            set_list
            if @list.current_user == session[:current_user]
                @list = List.find_by_id(params[:id])
                @list.delete 
                session[:message] = "Your vault has been cleared of #{@list.item}"
                redirect '/lists'
            end
        else
                redirect 'lists'
        end
    end


    private

    def set_list
        @list = current_user.lists.find_by_id(params[:id])
    end
end