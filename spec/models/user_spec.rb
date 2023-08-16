require 'rails_helper'

RSpec.describe User, type: :model do
  it "is not valid without the full_name" do
    user=User.new(email:"ms@gmail.com",full_name:"dsfds",age:34,phone_number:0334563,gender:"male",address:"jfdfsf",password:"fdsfdsfdsfdsf")
    # byebug
    expect(user).to be_valid
  end
  it "is not valid without the age limitation" do
    user=User.new(email:"ms@gmail.com",full_name:"dsfds",age:12,phone_number:0334563,gender:"male",address:"jfdfsf",password:"fdsfdsfdsfdsf")
    expect(user).to_not be_valid

  end
  # pending "add some examples to (or delete) #{__FILE__}"
end
