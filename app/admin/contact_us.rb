ActiveAdmin.register ContactUs do
    permit_params :reply, :user_id, :message, :admin_user_id

    index do
      selectable_column
      id_column
      column :user_id
      column :message
      column :reply
      column :admin_user_id
      column :created_at
      column :updated_at

      actions
    end

  end
