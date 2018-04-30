class Inscontracts < ActiveRecord::Migration[5.1]
  def change
    add_column :inscontracts, :premium, :string
  end
end
