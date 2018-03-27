class CreateContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :contracts do |t|
      t.integer :member_id
      t.datetime :inception_datetime
      t.datetime :expiry_datetime
      t.string   :product

      t.timestamps
    end
  end
end
