class AddUserReplyToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user_reply, :json
  end
end
