class AddDefaultToItems < ActiveRecord::Migration[5.2]
  def change
    change_column_null :items, :size_id, true, nil
  end
end
