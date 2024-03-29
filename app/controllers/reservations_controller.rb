class ReservationsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :show, :update]

  # get /reservations
  def index
    @reservations = Reservation.all
  end

  def calendar
    @year = params[:year]? params[:year].to_i : Date.today.year
    @month = params[:month]? params[:month].to_i : Date.today.month
    @reservations_dates = Reservation.pluck(:utilization_date)
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
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      # @reservation.send_activation_email
      flash[:info] = "予約しました"
      redirect_to root_path
    else
      render 'new'
    end
  end

  # patch /reservations/:id
  def update
    @reservation = Reservation.find(params[:id])
    begin
      ActiveRecord::Base.transaction do
        @reservation.update!(reservation_params)
        @reservation.reservations_equipments.all.map(&:destroy!)
        params[:equipments].each do |index, use|
          if use == '1'
            ReservationsEquipment.create!(reservation_id: @reservation.id,
                                         equipment_id: index)
          end
        end
      end
      flash[:success] = "予約を編集しました"
      redirect_to @reservation
    rescue ActiveRecord::RecordInvalid
      @utilization_time = UtilizationTime.all
      @equipments = Equipment.all
      render 'edit'
    end
  end

  private
    def reservation_params
      params.require(:reservation).permit(
        :group, :username, :tel, :email, :payment_method_id, :disabled,
        :purpose, :remarks, :utilization_date, :utilization_time_id)
    end

    def logged_in_user
      redirect_to login_path if !session[:login]
    end
end
