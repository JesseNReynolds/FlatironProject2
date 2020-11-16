class CreateMessages < ActiveRecord::Migration
 
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.datetime :sent
      t.text :content
    end
  end

end
