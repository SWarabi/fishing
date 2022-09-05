class CreateCatchComments < ActiveRecord::Migration[6.1]
  def change
    create_table :catch_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :catch_id

      t.timestamps
    end
  end
end
