ActiveAdmin.register User do
    permit_params :full_name


    index do
        selectable_column
        id_column
        column :beer_id
        column :full_name
        column :age
        column :address
        column :gender
        column :email
        column :created_at
        column :updated_at


        actions
    end

end
