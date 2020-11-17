class MessagesController < ApplicationController

  # GET: /messages
  get "/messages" do
    erb :"/messages/index"
  end

  # GET: /messages/new
  get "/messages/new" do
    erb :"/messages/new"
  end

  # POST: /messages
  post "/messages" do
    redirect "/messages"
  end

  # GET: /messages/5
  get "/messages/:id" do
    erb :"/messages/show"
  end

  # GET: /messages/5/edit
  get "/messages/:id/edit" do
    erb :"/messages/edit"
  end

  # PATCH: /messages/5
  patch "/messages/:id" do
    redirect "/messages/:id"
  end

  # DELETE: /messages/5/delete
  delete "/messages/:id/delete" do
    redirect "/messages"
  end
end
