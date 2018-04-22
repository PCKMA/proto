class CreateInscontracts < ActiveRecord::Migration[5.1]
  def change
    create_table :inscontracts do |t|
      t.integer  :member_id
      t.datetime :inception_datetime_at
      t.datetime :expiry_datetime_at
      t.integer  :product_id

      t.timestamps
    end
  end
end
