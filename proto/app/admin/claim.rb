ActiveAdmin.register Claim do
  permit_params :state
  actions :all, except: [:new, :destroy]

  index do
    selectable_column
    column :member_id
    column :product_id
    column :claim_datetime_at
#    column :image
    column :claim_amount
    column :description
    column :state
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :member_id
      f.input :product_id
      f.input :claim_datetime_at
      f.input :claim_amount
      f.input :description
      f.input :created_at
      f.input :updated_at
    end
    f.inputs do
      f.input :state, as: :select, collection: ['claimed', 'approved', 'paid', 'declined']
    end
    f.actions
  end

  filter :member_id
  filter :product_id
  filter :claim_datetime_at
  filter :state

  action_item :claim_approved, only: :show, priority: 1, if: proc{claim.state == 'approved'} do
    ClaimMailer.claim_approved(Member.find(claim.member_id)).deliver_now
    'email sent to ' + Member.find(claim.member_id).email + ' successfully.'
  end

end
