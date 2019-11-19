class CreateDeliveryMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_methods do |t|
      t.string :method, null: false
      t.timestamps null: false
    end
  end
end
