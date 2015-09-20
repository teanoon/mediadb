class AddFrameToMedium < ActiveRecord::Migration
  def change
    add_column :media, :header, :text
    add_column :media, :footer, :text
  end
end
