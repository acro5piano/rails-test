require 'rails_helper'

describe ReservationsController, type: :controller do
  before do
    @equipment = create(:equipment)
  end

  it 'renders template index' do
    get :index
    expect(response).to render_template :index
  end

  it "assigns Reservation in edit_reservation_path" do
    @reservation = create(:reservation)
    get :edit, id: @reservation
    expect(assigns(:reservation)).to eq(@reservation)
  end

  it "save a record successfully" do
    expect {
      post :create, reservation: attributes_for(:reservation)
    }.to change(Reservation, :count).by(1)
    expect(response).to redirect_to root_path
  end

  it "update a record" do
    @reservation = create(:reservation)
    patch :update, id: @reservation, reservation: attributes_for(:reservation), equipments: [1]
    expect(response).to redirect_to reservation_path(@reservation)
  end
end
