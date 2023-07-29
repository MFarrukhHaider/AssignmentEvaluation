class User < ApplicationRecord

  has_many :ratings
  has_many :favorite_beers
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :full_name, presence: true, uniqueness: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 18 }
  validates :phone_number, presence: true, numericality: {only_integer: true, minimum:11 ,maximum: 11}, uniqueness: true
  validates :gender, presence: true
  validates :address, presence: true
  enum gender: {male: 'M', female: 'F'}

  def self.ransackable_attributes(auth_object = nil)
    ["address", "age", "created_at", "email", "encrypted_password", "full_name", "gender", "id", "phone_number", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
  end
  
  def self.ransackable_associations(auth_object = nil)
    ["comments", "favorite_beers", "ratings"]
  end
end
