ActiveAdmin.register Beer do
    permit_params :name, :tagline, :abv, :ibu, :description

    index do
        selectable_column
        id_column
        column :name
        column :tagline
        column :first_brewed
        column :description
        column :alcohol_by_volume
        column :ibu
        column :ebc
        column :abv
        column :srm
        column :ph
        column :attenuation_level
        column :volume
        column :boil_volume
        column :method
        column :ingredients
        column :food_pairing
        column :brewers_tips
        column :created_at
        column :updated_at


        actions
    end

end

