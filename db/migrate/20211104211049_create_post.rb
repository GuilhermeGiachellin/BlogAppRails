class CreatePost < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.interger :comments_counter
      t.integer :likes_counter

      t.timestamps
    end
  end
end
