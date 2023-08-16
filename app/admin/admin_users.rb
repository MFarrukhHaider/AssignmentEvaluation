ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation


  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end


  collection_action :import_csv, method: :post do
    UploadDataFromCsvWorker.perform_async
    redirect_to admin_admin_users_path, notice: 'CSV file successfully imported and users created.'

  end
  action_item :import_csv, only: :index do
    link_to 'Import CSV',"/admin/admin_users/import_csv",method: :post
  end

  collection_action :load_data, method: :get do
    public_api_service = PublicApiService.new
    data_from_api = public_api_service.fetch_data
    data_from_api.each do |data|

      api_data={
        name: data['name'],
        tagline: data['tagline'],
        first_brewed: data['first_brewed'],
        description: data['description'],
        alcohol_by_volume: data['abv'],
        ibu: data['ibu'],
        ebc: data['ebc'],
        srm: data['srm'],
        ph: data['ph'],
        attenuation_level: data['attenuation_level'],
        volume: data['volume'],
        boil_volume: data['boil_volume'],
        method: data['method'],
        ingredients: data['ingredients'],
        food_pairing: data['food_pairing'],
        brewers_tips: data['brewers_tips']
      }

      beers_model = Beer.new(api_data)
      beers_model.save(validate: false)
    end
  
    redirect_to admin_admin_users_path, notice: 'Data is succesfully loaded in the model'

  end
  action_item :load_data, only: :index do
    link_to 'Load Data',"/admin/admin_users/load_data",method: :get
  end


  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end



end