class MessagesController < ApplicationController

  # GET: /messages
  get "/messages" do
    if Helper.is_logged_in?(session)
      @conversations = Message.user_conversations(session)
      erb :"/messages/index"
    else
      "You must be logged in to view messages."
    end
  end

  # GET: /messages/new
  get "/messages/new" do
    erb :"/messages/new"
  end

  # POST: /messages
  post "/messages/:id" do
    Message.create({:content => params[:message][:content], :sender_id => Helper.current_user(session).id, :recipient_id => params[:id], :read => false})
    redirect "/messages/#{params[:id]}"
  end

  post "/messages" do
    if recipient = User.find_by(:username => params[:message][:to_username])
      Message.create({:content => params[:message][:content], :sender_id => Helper.current_user(session).id, :recipient_id => recipient.id, :read => false})
      redirect "/messages/#{recipient.id}"
    else
      "Sorry, I couldn't find a user with that username, please try again."
    end
    
  end

  # GET: /messages/5
  # Likely needs a refactor to save back-end resources
  get "/messages/:id" do
    @other_user = User.find(params[:id])
    @conversation = Message.sorted_single_conversation(session: session, other_user_id: params[:id]).each{|m| m.read = true}
    erb :"/messages/show"
  end

end
