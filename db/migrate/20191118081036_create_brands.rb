class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string :name, null: false, index: true, unique: true
      t.timestamps null: false
    end
  end
end
