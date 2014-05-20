class Colors < ActiveRecord::Migration
  def change
  	create_table :colors do |t|
      t.string :name
      t.integer :user_id
    end
  end
end
