class ChangeColumnNullTags < ActiveRecord::Migration
  def change
    change_column_null :tags, :name, false
  end
end
