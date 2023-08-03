class AddUserReferenceToBeers < ActiveRecord::Migration[6.1]
  def change
    add_reference :beers, :user, foreign_key: true
  end
end
