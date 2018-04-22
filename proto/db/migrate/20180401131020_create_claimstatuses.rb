class CreateClaimstatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :claimstatuses do |t|
      t.string :claimstate

      t.timestamps
    end
  end
end
