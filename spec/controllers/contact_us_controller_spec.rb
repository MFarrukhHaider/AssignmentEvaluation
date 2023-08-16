require 'rails_helper'

RSpec.describe ContactUsController, type: :controller do
    describe '#new' do
        it 'should render new page successfully' do
          get :new
          # it{ expect(response).to have_http_status(:ok)}
          # expect(response).to redirect_to "/beers/#{}/users_comments/new"
        end
      end
end
describe "POST #create" do


    it "submits to the create template" do
        @user = User.create!(password: "fdsfdsfdsfds", email: "test@example.com", full_name: "123nil", age: 78, phone_number: 03356372, address: "nil1234", gender: "male", user_reply: "322n432il")
        admin_user=AdminUser.create(email:"jkasj@gmail.com",password:"32323")
        contact_us=ContactUs.create(message:"sda",user_id: @user.id,admin_user_id: admin_user.id,reply:"")
        byebug
        # beer1 = Beer.create(name: "Test Beer 1", user_id: @user.id)
        # @user_comment = UsersComment.new(user_id:@user.id,beer_id:beer1.id,description:"dgsds")
        
        post :create, params: { user_id: @user.id, admin_user_id: admin_user.id }
        # byebug
    #   expect(response).to render_template(:new)
        expect(response).to have_http_status(200)
        # expect(response).to redirect_to " /beers/#{beer1.id}/users_comments/new"


    end
  end