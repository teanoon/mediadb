class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :login_name
      t.integer :media_type
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
