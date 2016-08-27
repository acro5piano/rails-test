require 'rails_helper'

describe Reservation, type: :model do
  before do
    @reservation = create(:reservation)
    @equipment = create(:equipment)
    @reservations_equipment = create(:reservations_equipment)
  end

  describe '#use' do
    subject { @reservation.use? @equipment }

    context 'when reservation has a equipment' do
      it { is_expected.to be true }
    end

    context 'when reservation does not have any equipment' do
      it do
        @reservations_equipment.destroy
        is_expected.to be false
      end
    end
  end

  describe '#valid?' do
    subject { @reservation.valid? }

    context 'when all attributes is present' do
      it { is_expected.to be true }
    end

    required_attributes = %w(
      username
      tel
      email
      purpose
      payment_method_id
      utilization_date
      utilization_time_id
    )

    required_attributes.each do |attr|
      context "when #{attr} is blank" do
        before do
          @reservation[attr] = ''
        end
        it { is_expected.to be false }
        example { expect{ @reservation.save! }.to raise_error(ActiveRecord::RecordInvalid) }
      end
    end

    context "when email is valid address" do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                                     first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        it do
          @reservation.email = valid_address
          is_expected.to be true
        end
      end
    end

    context "when email is invalid address" do
      invalid_addresses = %w[user@example,com USER_foo.org user.name@example
                                     first.last@foo_buz.jp alice@baz+alice.cn]
      invalid_addresses.each do |invalid_address|
        it do
          @reservation.email = invalid_address
          is_expected.to be false
        end
      end
    end
  end
end
