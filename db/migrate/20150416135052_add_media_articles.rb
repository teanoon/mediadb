class AddMediaArticles < ActiveRecord::Migration
  def change
    create_table(:media_articles) do |t|
      t.references :media,    null: false
      t.references :articles, null: false
      t.integer :status,     null: false, default: 0
    end
  end
end
