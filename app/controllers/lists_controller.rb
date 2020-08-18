class ListsController < ApplicationController

    get '/lists' do
        login_required
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
        params.delete(:_method)                         #update 
        set_list
        @list.update(params)
        redirect "/lists/#{@list.id}"
    end

    
    delete '/lists/:id' do 
                           #delete action
        login_required
        set_list
        if @list
           @list.destroy
            session[:message] = "Your vault has been cleared of #{@list.item}"
            redirect '/lists'        
        else
            redirect '/login'
        end
    end


    private

    def set_list
        @list = current_user.lists.find_by_id(params[:id])
    end
end