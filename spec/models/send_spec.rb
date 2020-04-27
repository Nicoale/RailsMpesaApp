require 'rails_helper'

RSpec.describe Send, type: :model do
  it 'should have valid Factory' do
    expect(FactoryBot.create(:sends)).to be_valid
  end
  describe '#sends table column' do
     it { is_expected.to have_db_column :senders_phone_number }
     it { is_expected.to have_db_column :receivers_phone_number}
     it { is_expected.to have_db_column :amount }
     it { is_expected.to have_db_column :pin }
     it { is_expected.to have_db_column :balance }
  end
  describe '#validation of sends attributes' do
    it { is_expected.to validate_presence_of(:senders_phone_number)}  
    it { is_expected.to validate_length_of(:senders_phone_number)}
    it { is_expected.to validate_numericality_of(:senders_phone_number)}
    it { is_expected.to validate_uniqueness_of(:senders_phone_number)}
    #.case_insensitive
    it { is_expected.to validate_presence_of(:senders_phone_number)}  
    it { is_expected.to validate_length_of(:senders_phone_number)}
    it { is_expected.to validate_numericality_of(:senders_phone_number)}
    it { is_expected.to validate_uniqueness_of(:senders_phone_number)} 
    it { is_expected.to validate_presence_of(:amount)}  
    it { is_expected.to validate_numericality_of(:amount)} 
    it { is_expected.to validate_presence_of(:balance)}  
    it { is_expected.to validate_numericality_of(:balance)}  
    it { is_expected.to validate_presence_of(:pin)}  
    it { is_expected.to validate_length_of(:pin)}
    it { is_expected.to validate_numericality_of(:pin)}
  end
  describe "#creating sends " do
    it 'creates sends with valid attributes' do
      user = FactoryBot.create(:user) 
      expect(send.senders_phone_number).to eq '012345678' 
      expect(send.receivers_phone_number).to eq '012345678' 
      expect(send.balance).to eq 0.0 
      expect(send.pin).to eq 1234 
    end
    it "does alert user on successful sending " do
      send= FactoryBot.build(:sends, phone_number: "012345678")
     send.save        
      expect(user.messages[:phone_number]).to eq ["successful!)"]
    end
  end
end
