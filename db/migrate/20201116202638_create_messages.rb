class CreateMessages < ActiveRecord::Migration
 
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.timestamp :created_at
      t.text :content
      t.boolean :read
    end
  end

end
