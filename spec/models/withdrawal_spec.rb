# frozen_string_literal: true

require 'rails_helper'

RSpec.describe withdrawal, type: :model do
  it 'should have valid Factory' do
    expect(FactoryBot.create(:withdrawal)).to be_valid
  end
  describe '#withdrawal table column' do
    it { is_expected.to have_db_column :phone_number }
    it { is_expected.to have_db_column :amount }
    it { is_expected.to have_db_column :pin }
    it { is_expected.to have_db_column :agent_number }
  end
  describe '#validation of withdrawal attributes' do
    it { is_expected.to validate_presence_of(:phone_number) }
    it { is_expected.to validate_length_of(:phone_number) }
    it { is_expected.to validate_numericality_of(:phone_number) }
    it { is_expected.to validate_uniqueness_of(:phone_number) }
    # .case_insensitive
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_numericality_of(:amount) }
    it { is_expected.to validate_presence_of(:agent_number) }
    it { is_expected.to validate_numericality_of(:agent_number) }
    it { is_expected.to validate_length_of(:agent_number) }
    it { is_expected.to validate_presence_of(:pin) }
    it { is_expected.to validate_length_of(:pin) }
    it { is_expected.to validate_numericality_of(:pin) }
  end
  describe '#creating withdrawal ' do
    it 'creates withdrawal with valid attributes' do
      user = FactoryBot.create(:user)
      expect(user.phone_number).to eq '012345678'
      expect(user.agent_number).to eq '0123456'
      expect(user.pin).to eq 1234
    end
    it 'does alert user on successful withdrawal' do
      user = FactoryBot.build(:withdrawal, phone_number: '012345678')
      user.save
      expect(user.messages[:phone_number]).to eq ['successful!)']
    end
  end
end
