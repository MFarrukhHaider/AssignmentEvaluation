class ContactUs < ApplicationRecord
  belongs_to :user
  belongs_to :admin_user
  def self.ransackable_attributes(auth_object = nil)
    ["admin_user_id", "created_at", "id", "message", "updated_at", "user_id","reply"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["admin_user", "user"]
  end
end
