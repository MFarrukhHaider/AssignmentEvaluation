class UploadDataFromCsvWorker
    include Sidekiq::Worker

    def perform()
        require 'csv'
        csv_file = "import.csv"
        CSV.foreach(csv_file, headers: true) do |row|
                Beer.create!(
                name: row['name'],
                tagline: row['tagline'],
                first_brewed: row['first_brewed'],
                description: row['description'],
                alcohol_by_volume: row['alcohol_by_volume'],
                ibu: row['ibu'],
                ebc: row['ebc'],
                srm: row['srm'],
                ph: row['ph'],
                attenuation_level: row['attenuation_level'],
                volume: row['volume'],
                boil_volume: row['boil_volume'],
                ingredients: row['ingredients'],
                food_pairing: row['food_pairing'],
                brewers_tips: row['brewers_tips'],
                user_id: row['user_id']
              )
        end
    end
end