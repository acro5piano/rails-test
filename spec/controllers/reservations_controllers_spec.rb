require 'rails_helper'

describe ReservationsController, type: :controller do
  before do
    @reservation = create(:reservation)
    @equipment = create(:equipment)
    @reservations_equipment = create(:reservations_equipment)
  end

  it 'renders template index' do
    get :index
    expect(response).to render_template :index
  end

  it "assigns Reservation in edit_reservation_path" do
    get :edit, id: @reservation
    expect(assigns(:reservation)).to eq(@reservation)
  end

  pending "save a record successfully" do
    expect {
      post :create, user: attributes_for(:reservation)
    }.to change(Reservation, :count).by(1)
    expect(response).to redirect_to reservation_path(assigns([:reservation]))
  end

  it "update a record" do
    patch :update, id: @reservation, reservation: attributes_for(:reservation), equipments: [1]
    expect(response).to redirect_to reservation_path(@reservation)
  end
end
