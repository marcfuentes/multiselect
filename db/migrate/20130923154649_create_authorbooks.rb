class CreateAuthorbooks < ActiveRecord::Migration
  def change
    create_table :authorbooks do |t|
      t.integer :author_id, :null => false
      t.integer :book_id, :null => false

      t.timestamps
    end
  end
end
