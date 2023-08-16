require 'rails_helper'

RSpec.describe UsersCommentsController, type: :controller do
  describe "#index" do
    it "renders the index template" do
        @user = User.create!(password: "fdsfdsfdsfds", email: "test@example.com", full_name: "123nil", age: 78, phone_number: 03356372, address: "nil1234", gender: "male", user_reply: "322n432il")
        beer1 = Beer.create(name: "Test Beer 1", user_id: @user.id)
        # byebug
      # Make a GET request to the index action
    #   get :index
        get :index, params: { beer_id: beer1.id }
        # byebug
      # Check if the response renders the index template
      expect(response).to have_http_status(200)
    #   response_body  = JSON.parse(response.body)
    #   expect(response).to redirect_to "/beers/#{beer1.id}/users_comments"
  end
end

# describe "#show" do
#     it "renders the show template" do
#         @user = User.create!(password: "fdsfdsfdsfds", email: "test@example.com", full_name: "123nil", age: 78, phone_number: 03356372, address: "nil1234", gender: "male", user_reply: "322n432il")
#         beer1 = Beer.create(name: "Test Beer 1", user_id: @user.id)
#         # byebug
#       # Make a GET request to the index action
#     #   get :index
#         get :index, params: { beer_id: beer1.id }
#         # byebug
#       # Check if the response renders the index template
#       expect(response).to have_http_status(200)
#     #   response_body  = JSON.parse(response.body)
#     #   expect(response).to redirect_to "/beers/#{beer1.id}/users_comments"
#     end
#   end
# end


# describe "#new" do
#     it "renders the new template" do
#         @user = User.create!(password: "fdsfdsfdsfds", email: "test@example.com", full_name: "123nil", age: 78, phone_number: 03356372, address: "nil1234", gender: "male", user_reply: "322n432il")
#         beer1 = Beer.create(name: "Test Beer 1", user_id: @user.id)
#         # @user_comment = UsersComment.create!(user_id:@user.id,beer_id:beer1.id,description:"dgsds")
#     #   get :index
#         # byebug
#         get :new, params: { beer_id: beer1.id }
#         # byebug
#       expect(response).to have_http_status(200)
#     #   response_body  = JSON.parse(response.body)
#     #   expect(response).to redirect_to "/beers/#{beer1.id}/users_comments"
#     end
#   end
# spec/controllers/user_comments_controller_spec.rb


  describe "GET #new" do


    it "renders the :new template" do
        @user = User.create!(password: "fdsfdsfdsfds", email: "test@example.com", full_name: "123nil", age: 78, phone_number: 03356372, address: "nil1234", gender: "male", user_reply: "322n432il")
        beer1 = Beer.create(name: "Test Beer 1", user_id: @user.id)
        @user_comment = UsersComment.new(user_id:@user.id,beer_id:beer1.id,description:"dgsds")

        get :new, params: { beer_id: beer1.id }
        # byebug
    #   expect(response).to render_template(:new)
        expect(response).to have_http_status(200)
        # expect(response).to redirect_to " /beers/#{beer1.id}/users_comments/new"


    end
  end
  describe "POST #create" do


    it "submits the :create template" do
        @user = User.create!(password: "fdsfdsfdsfds", email: "test@example.com", full_name: "123nil", age: 78, phone_number: 03356372, address: "nil1234", gender: "male", user_reply: "322n432il")
        beer1 = Beer.create(name: "Test Beer 1", user_id: @user.id)
        @user_comment = UsersComment.create(user_id:@user.id,beer_id:beer1.id,description:"dgsds")

        post :create, params: { beer_id: beer1.id , user_id: @user.id}
        # byebug
    #   expect(response).to render_template(:new)
        expect(response).to have_http_status(200)
        # expect(response).to redirect_to " /beers/#{beer1.id}/users_comments/new"


    end
  end
end



#     it "renders the index template" do
#       # Make a GET request to the index action
#       get :index

#       # Check if the response renders the index template
#       expect(response).to render_template(:index)
#     end
#   end
# end
