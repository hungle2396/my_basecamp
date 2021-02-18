class ChatroomsController < ApplicationController
    
    def index
        @chatmessages = Chatmessage.all
        @chatmessage = Chatmessage.new
    end
end