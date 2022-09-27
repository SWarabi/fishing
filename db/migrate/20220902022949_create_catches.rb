class CreateCatches < ActiveRecord::Migration[6.1]
  def change
    create_table :catches do |t|
      t.string :fish
      t.string :point
      t.string :gear
      t.date :day
      t.datetime :time
      t.text :comment
      t.integer :user_id
      t.boolean :is_draft, null: false, default: true
      
      t.string :address
      t.float :latitude
      t.float :longitude
      
      t.timestamps
    end
    
    
  
  end
end
