class CreateBooks < ActiveRecord::Migration
  
  def change
    create_table :books do |t|
      t.string :author
      t.string :title
      t.string :published
      t.integer :user_id
    end
  end

end
