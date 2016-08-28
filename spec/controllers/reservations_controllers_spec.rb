require 'rails_helper'

describe ReservationsController, type: :controller do
  before do
    @equipment = create(:equipment)
  end

  it 'renders template index' do
    log_in
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

  describe '#update' do
    context 'valid input' do
      it "update a record" do
        @reservation = create(:reservation)
        patch :update, id: @reservation, reservation: attributes_for(:reservation), equipments: [1]
        expect(response).to redirect_to reservation_path(@reservation)
      end
    end

    context 'invalid input' do
      it "doesn't update a record" do
        @reservation = create(:reservation)
        invalid_reservation_param = attributes_for(:reservation)
        invalid_reservation_param[:username] = nil
        patch :update, id: @reservation, reservation: invalid_reservation_param, equipments: [1]
        expect(response).to render_template :edit, id: @reservation
      end
    end
  end
end
