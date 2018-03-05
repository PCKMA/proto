ActiveAdmin.register Member do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  index do
    selectable_column
    id_column
    column :email
#    column :encrypted_password
#    column :reset_password_token
    column :reset_password_sent_at
#    column :remember_created_at
#    column :sign_in_count
    column :current_sign_in_at
#    column :last_sign_in_at
#    column :current_sign_in_ip
#    column :last_sign_in_ip
    column :created_at
    column :updated_at
  end

  filter :email
  filter :current_sign_in_at
#  filter :sign_in_count
  filter :created_at
  filter :updated_at

end
