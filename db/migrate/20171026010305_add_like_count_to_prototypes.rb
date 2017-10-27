class AddLikeCountToPrototypes < ActiveRecord::Migration
  def change
    add_column :prototypes, :like_count, :integer
  end
end
