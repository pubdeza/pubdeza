class AddPrefectureToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :prefecture, :string
  end
end
