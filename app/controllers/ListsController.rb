class ListsController < ApplicationController

    get '/lists' do
        @lists = current_user.lists.all
        erb :'lists/index'
    end

end