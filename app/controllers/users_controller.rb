class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    @users = User.all
    erb :"/users/index"
  end

  get "/users/login" do

    erb :"/users/login"
  end

  get '/users/logout' do
    session.clear
    redirect to '/'
  end

  post "/users/login" do
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
      "Login error, unknown username and/or password."
    end
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

  get "/users/my_library" do
    if session[:user_id]
      @library = Book.all.select{|b| b.user_id == Helper.current_user(session).id}
      erb :"/users/my_library"
    else
      "You must log in to view your library."
    end

  end

  get "/users/others/books" do
    @other_users_books = Book.all.select{|b| b.user_id != Helper.current_user(session).id}
    erb :"/users/available_books"
  end
  
  # GET: /users/5
  get "/users/:id" do
    @user = Helper.current_user(session)
    @user_books = Book.all.select{|b| b.user_id == @user.id}
    if @user.id == Helper.current_user(session).id
      erb :"/users/my_account"
    else
      erb :"/users/show"
    end
  end

  # PATCH: /users/5
  patch "/users/:id" do
    # binding.pry
    user = User.find_by(:id => params[:id])
    user.update(params["user"])
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    user = Helper.current_user(session)
    user_books = Books.all.select {|b| b.user_id == user.id}
    user_books.delete_all
    user.delete
    redirect "/welcome"
  end
  
  get "/users/:id/delete" do
    @user = Helper.current_user(session)
    erb :"/users/delete"
  end


end
