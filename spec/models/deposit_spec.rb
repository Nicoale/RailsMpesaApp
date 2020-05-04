# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Deposit, type: :model do
  it 'should have valid Factory' do
    expect(FactoryBot.create(:deposit)).to be_valid
  end
  describe '#deposit table column' do
    it { is_expected.to have_db_column :phone_number }
    it { is_expected.to have_db_column :new_deposit }
    it { is_expected.to have_db_column :pin }
    it { is_expected.to have_db_column :balance }
  end
  describe '#validation of deposit attributes' do
    it { is_expected.to validate_presence_of(:phone_number) }
    it { is_expected.to validate_length_of(:phone_number) }
    it { is_expected.to validate_numericality_of(:phone_number) }
    it { is_expected.to validate_uniqueness_of(:phone_number) }
    # .case_insensitive
    it { is_expected.to validate_presence_of(:new_deposit) }
    it { is_expected.to validate_numericality_of(:new_deposit) }
    it { is_expected.to validate_presence_of(:balance) }
    it { is_expected.to validate_numericality_of(:balance) }
    it { is_expected.to validate_presence_of(:pin) }
    it { is_expected.to validate_length_of(:pin) }
    it { is_expected.to validate_numericality_of(:pin) }
  end
  describe '#creating deposit ' do
    it 'creates deposit with valid attributes' do
      user = FactoryBot.create(:user)
      expect(user.phone_number).to eq '012345678'
      expect(user.balance).to eq 0.0
      expect(user.pin).to eq 1234
    end
    it 'does alert user on successful deposit' do
      user = FactoryBot.build(:deposit, phone_number: '012345678')
      user.save
      expect(user.messages[:phone_number]).to eq ['successful!)']
    end
  end
end
