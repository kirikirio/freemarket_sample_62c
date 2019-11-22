class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false, index: true
      t.integer :price, null:false
      t.text :description, null:false
      t.references :item_status, null: false, foreign_key: true
      t.references :sale_status, null: false, foreign_key: true
      t.references :size, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true
      t.references :delivery_status, null: false, foreign_key: true
      # 以下テスト
      t.text :prefecture_id, null: false

      t.references :user, null: false, foreign_key: true
      t.references :category, null: false , foreign_key: true
      t.string :delivery_fee, null: false
      t.references :delivery_method, null: false , foreign_key: true
      t.timestamps null: false
    end
  end
end