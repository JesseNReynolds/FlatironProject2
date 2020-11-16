class CreateBooks < ActiveRecord::Migration
  
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :author
      t.string :title
      t.string :published
    end
  end

end
