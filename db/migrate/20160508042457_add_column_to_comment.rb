class AddColumnToComment < ActiveRecord::Migration
  def change
    add_column :comments, :contents, :text
  end
end
