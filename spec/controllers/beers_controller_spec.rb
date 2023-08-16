# require 'rails_helper'

# RSpec.describe BeersController, type: :controller do
#   describe  '#index' do
#     before { get :index}
#     it 'should render a template' do
#       # byebug
#       # get :index
#       # expect(response).to have_http_status(:success)

#       expect(response).to render_template('/beers')
#     end
#   end
# end
# require 'rails_helper'

# require 'rails_helper'


# end













require 'rails_helper'

RSpec.describe BeersController, type: :controller do
  describe "#index" do
    it "assigns @user_beers with the beers of the current user" do
      @user = User.create!(password: "fdsfdsfdsfds", email: "test@example.com", full_name: "123nil", age: 78, phone_number: 03356372, address: "nil1234", gender: "male", user_reply: "322n432il")
      beer1 = Beer.create(name: "Test Beer 1", user: @user)
      beer2 = Beer.create(name: "Test Beer 2", user: @user)
      allow(controller).to receive(:current_user).and_return(@user)

      get :index

      expect(assigns(:user_beers)).to eq([beer1, beer2])
    end

    it "renders the index template" do
      # Create a test User object in the test database
      @user = User.create!(password: "fdsfdsfdsfds", email: "test@example.com", full_name: "123nil", age: 78, phone_number: 03356372, address: "nil1234", gender: "male", user_reply: "322n432il")
      
      # Stub the current_user method on the controller to return the test user
      allow(controller).to receive(:current_user).and_return(@user)

      # Make a GET request to the index action
      get :index
      # byebug
      # Check if the response renders the index template
      expect(response).to render_template(:index)
    end
  end
end





  # describe 'GET show' do
  #   it 'assigns @beer' do
  #     user = User.create!(password: "fdsfdsfdsfds", email: "test@example.com", full_name: "123nil", age: 78, phone_number: 03356372, address: "nil1234", gender: "male", user_reply: "322n432il")
  #     beer = Beer.create!(name: "shdkjsa",tagline: "",first_brewed: "",description: "",alcohol_by_volume: "",ibu: "",ebc: "",srm: "",ph: "",attenuation_level: "",volume: "",boil_volume: "",method: "",ingredients: "",food_pairing: "",brewers_tips: " ",user_id: user.id)

  #     # Send a GET request to the show action
  #     get :show, params: { id: beer.id }

  #     expect(assigns(:beer)).to eq(beer)
  #     expect(response).to render_template(:show)
  #   end
  # end


  
#   describe '#new' do
#     it 'should render new page successfully' do
#       get :new

#       # it{ expect(response).to have_http_status(:ok)}
#       expect(response).to render_template(:new)
#     end
#   end

#   describe '#create' do
#     before { post :create, params:{post:{title:"hello",context:"khan",published:true}}}

#     it 'should create a new post' do
#       expect(response).to redirect_to('/all_posts')
#     end
#   end

# end