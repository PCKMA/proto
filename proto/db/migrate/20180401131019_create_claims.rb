class CreateClaims < ActiveRecord::Migration[5.1]
  def change
    create_table :claims do |t|
      t.integer  :member_id
      t.integer  :product_id
      t.datetime :claim_datetime_at
      t.string :image
      t.string :description
      t.string :state
      
      t.timestamps
    end
  end
end
