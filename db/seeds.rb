User.create(username: "test", password: "test")
User.create(username: "test2", password: "test")
Book.create(title: "Title", author: "Author Name", published: "1969", user_id: 1)
Book.create(title: "Title", author: "Author Name", published: "1969", user_id: 2)
Book.create(title: "Title that is medium", author: "Author Name", published: "1969", user_id: 1)
Book.create(title: "Title", author: "Author Name", published: "1969", user_id: 1)
Book.create(title: "Title", author: "Author Name", published: "1969", user_id: 2)
Book.create(title: "A Really Long Title that Goes On for a While", author: "Author Name", published: "1969", user_id: 2)
Book.create(title: "Title that is Kind of Long", author: "Author Name", published: "1969", user_id: 1)
Book.create(title: "Title that is medium", author: "Author Name", published: "1969", user_id: 2)
Book.create(title: "Title of book", author: "Author Name", published: "1969", user_id: 1)
Book.create(title: "Title", author: "Author Name", published: "1969", user_id: 2)
Book.create(title: "Title", author: "Author Name", published: "1969", user_id: 1)
Book.create(title: "Title", author: "Author Name", published: "1969", user_id: 1)
Book.create(title: "Title that is Kind of Long", author: "Author Name", published: "1969", user_id: 1)
Book.create(title: "Title", author: "Author Name", published: "1969", user_id: 2)
Book.create(title: "Title that is Kind of Long", author: "Author Name", published: "1969", user_id: 2)
Book.create(title: "A Really Long Title that Goes On for a While", author: "Author Name", published: "1969", user_id: 1)
Message.create(sender_id: 1, recipient_id: 2, created_at: 1605741912, content: "Some text")
Message.create(sender_id: 1, recipient_id: 2, created_at: 1605742012, content: "Some different text")
Message.create(sender_id: 2, recipient_id: 1, created_at: 1605742030, content: "Some text in response")