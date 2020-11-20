class MessagesController < ApplicationController

  # GET: /messages
  get "/messages" do
    if Helper.is_logged_in?(session)
      @current_user = Helper.current_user(session)
      @conversations = Message.user_conversations(session)
      erb :"/messages/index"
    else
      @error = "You must be logged in to view messages."
      erb :'/error'
    end
  end

  # GET: /messages/new
  get "/messages/new" do
    if Helper.is_logged_in?(session)
      erb :"/messages/new"
    else
      @error = "You must be logged in to send messages."
      erb :"/error"
    end
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
      @error = "Sorry, I couldn't find a user with that username, please try again."
      erb :'/error'
    end
  end

  # GET: /messages/5
  # Likely needs a refactor to save back-end resources
  get "/messages/:id" do
    if Helper.is_logged_in?(session)
      @other_user = User.find(params[:id])
      @current_user = Helper.current_user(session)
      @conversation = Message.sorted_single_conversation(session: session, other_user_id: params[:id])
      Message.check_and_mark_read(array_of_messages: @conversation, current_user: @current_user)
      erb :"/messages/show"
    else
      @error = "You must be logged in to view messages."
      erb :'/error'
    end
  end

end
