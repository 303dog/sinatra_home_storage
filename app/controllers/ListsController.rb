class ListsController < ApplicationController

    get '/lists' do
        @lists = current_user.lists.all   #index action: when this route(get 
        erb :'lists/index'                   # request) is hit, look up all the 
    end                                     # items that correspond to the current user. 
                                            # Then directs to the erb where it is told to render that "view".
    
    get '/lists/new' do                     #new action/ view for form to create new items for the user
        erb :'lists/new'
    end

    post '/lists' do    
        binding.pry                        #create action used by new.erb
      #  item = current_user.items.build(params)
      #  if item.save
      #    redirect "items/#{item.id}"
      #  else
      #      erb :'items.new'
      #  end                   
    end
end