class RenameMediaArticles < ActiveRecord::Migration
  def change
    rename_table :media_articles, :articles_media
    rename_column :articles_media, :media_id, :medium_id
    rename_column :articles_media, :articles_id, :article_id
  end
end
