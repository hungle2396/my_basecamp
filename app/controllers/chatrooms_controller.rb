class ChatroomsController < ApplicationController
    
    def index
        @chatmessages = Chatmessage.all
        @chatmessage = Chatmessage.new
        @users = User.all
    end
end