ActiveAdmin.register UsersComment do
    permit_params :user_id, :beer_id, :description



    index do
        selectable_column
        id_column
        column :user_id
        column :beer_id
        column :description
        column :created_at
        column :updated_at


        actions
    end

end
