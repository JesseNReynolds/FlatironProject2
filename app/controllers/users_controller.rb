require_relative './helper.rb'
class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    @users = User.all
    erb :"/users/index"
  end

  # GET: /users/new
  get "/users/new" do
    erb :"/users/new"
  end

  # POST: /users
  post "/users" do
    if !params[:email].include?("@")
      "Sorry, that doesn't look like an email address."
    elsif User.find_by_email(params[:email])
      "That email is already in use."
    elsif User.find_by_username(params[:username])
      "That username is already in use."
    else
      user = User.create(params)
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    end
  end

  # GET: /users/edit
  get "/users/edit" do
    @user = Helper.current_user(session)
    erb :"/users/edit"
  end
  
  # GET: /users/5
  get "/users/:id" do
    @user = User.find_by(params)
    if @user.id == Helpers.current_user(session).id
      erb :"/users/my_account"
    else
      erb :"/users/show"
    end
  end

  # PATCH: /users/5
  patch "/users/:id" do
    user = User.find_by(id => :id)
    user.update(params)
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
