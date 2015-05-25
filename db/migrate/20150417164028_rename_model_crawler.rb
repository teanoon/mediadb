class RenameModelCrawler < ActiveRecord::Migration
  def change
    rename_table :crawlers, :sources
  end
end
