class ReservationsController < ApplicationController
  # get /reservations
  def index
    @reservations = Reservation.all
  end

  # get /reservations/:id
  def show
    @reservation = Reservation.find(params[:id])
    @equipments = Equipment.all
  end

  # get /reservations/:id/edit
  def edit
    @reservation = Reservation.find(params[:id])
    @utilization_time = UtilizationTime.all
    @equipments = Equipment.all
    @reserved_equipments = @reservation.reservations_equipments.all
  end

  # get /reservations/new
  def new
  end

  # post /reservations
  def create
  end

  # delete /reservations/:id
  def destroy
  end

  # put /reservations
  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update_attributes(reservation_params)
      @reservation.reservations_equipments.all.map(&:destroy)
      params[:equipments].each do |index, use|
        if use == '1'
          ReservationsEquipment.create(reservation_id: @reservation.id,
                                       equipment_id: index)
        end
      end
      flash[:success] = "予約を編集しました"
      redirect_to @reservation
    else
      @utilization_time = UtilizationTime.all
      @equipments = Equipment.all
      render 'edit'
    end
  end

  private
    def reservation_params
      params.require(:reservation).permit(:utilization_date, :utilization_time_id, :group, :username, :tel,
                                          :email, :payment_method_id, :disabled)
    end
end
