ActiveAdmin.register Rating do
  permit_params :beer_rating
  scope :highly_rated
    config.paginate = true

      config.per_page = 1
      index do
          selectable_column
          id_column
          column :beer_id
          column :user_id
          column :beer_rating
          column :created_at
          column :updated_at
          actions
      end
end