class Claims < ActiveRecord::Migration[5.1]
  def change
    add_column :claims, :claim_amount, :string
  end
end
