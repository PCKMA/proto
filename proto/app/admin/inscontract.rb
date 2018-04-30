ActiveAdmin.register Inscontract do
  actions :index, :show

  index do
    selectable_column
    column :member_id
    column :product_id
    column :inception_datetime_at
    column :expiry_datetime_at
    column :premium
    column :created_at
    column :updated_at
    actions
  end

  filter :member_id
  filter :product_id

end
