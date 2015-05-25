class CreateCrawlers < ActiveRecord::Migration
  def change
    create_table :crawlers do |t|
      t.string :name
      t.text :url

      t.timestamps null: false
    end
  end
end
