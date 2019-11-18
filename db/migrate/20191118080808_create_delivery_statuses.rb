class CreateDeliveryStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_statuses do |t|
      t.string :status, null: false
      t.timestamps null: false
    end
  end
end
