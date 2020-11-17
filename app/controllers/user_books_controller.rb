class UserBooksController < ApplicationController

  # GET: /user_books
  get "/user_books" do
    erb :"/user_books/index"
  end

  # GET: /user_books/new
  get "/user_books/new" do
    erb :"/user_books/new"
  end

  # POST: /user_books
  post "/user_books" do
    redirect "/user_books"
  end

  # GET: /user_books/5
  get "/user_books/:id" do
    erb :"/user_books/show"
  end

  # GET: /user_books/5/edit
  get "/user_books/:id/edit" do
    erb :"/user_books/edit"
  end

  # PATCH: /user_books/5
  patch "/user_books/:id" do
    redirect "/user_books/:id"
  end

  # DELETE: /user_books/5/delete
  delete "/user_books/:id/delete" do
    redirect "/user_books"
  end
end
