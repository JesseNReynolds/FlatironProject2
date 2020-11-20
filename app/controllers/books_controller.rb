class BooksController < ApplicationController

  # GET: /books
  get "/books" do
    if Helper.is_logged_in?(session)
      @books = Book.all
      erb :"/books/index"
    else
      @error = "Please log in to view books."
      erb :'/error'
    end
  end

  # GET: /books/new
  get "/books/new" do
    if Helper.is_logged_in?(session)
      erb :"/books/new"
    else
      erb :'/error'
      @error = "Please log in to add a book to your trade-library."
    end
  end

  # POST: /books
  post "/books" do
    Helper.current_user(session).books.build(params[:book]).save
    redirect "/books"
  end

  # GET: /books/5
  get "/books/:id" do
    if Helper.is_logged_in?(session)
      @book = Book.find(params[:id])
      @owner = User.find(@book.user_id)
      erb :"/books/show"
    else
      @error = "Please log in to view books."
      erb :'/error'
    end
  end

  # GET: /books/5/edit
  get "/books/:id/edit" do
    @book = Book.find(params[:id])
    if @book.user_id == Helper.current_user(session).id
      erb :"/books/edit"
    else
      @error = "You can't edit books you don't own."
      erb :"/error"
    end
  end

  # PATCH: /books/5
  patch "/books/:id" do
    Book.find(params[:id]).update(params[:book])
    redirect "/books/#{params[:id]}"
  end

  get "/books/:id/delete" do
    @book = Book.find(params[:id])
    if @book.user_id == Helper.current_user(session).id
      erb :"/books/delete"
    else
      @error = "You cannot delete books you don't own."
      erb :"/error"
    end

  end

  # DELETE: /books/5/delete
  delete "/books/:id" do
    Book.find(params:[id]).delete
    redirect "/books"
  end
  
end
