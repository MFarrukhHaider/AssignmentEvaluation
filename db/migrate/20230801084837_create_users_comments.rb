class CreateUsersComments < ActiveRecord::Migration[6.1]
  def change
    create_table :users_comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :beer, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
