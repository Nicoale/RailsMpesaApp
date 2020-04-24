require 'rails_helper'

RSpec.describe Deposit, type: :model do
     it 'should have valid Factory' do
        expect(FactoryBot.create(:deposit)).to be_valid
     end
 describe '#deposits table column'do
     it { is_expected.to have_db_column :id_number }
     it { is_expected.to have_db_column :phone_number }
     it { is_expected.to have_db_column :new_deposit }
     it { is_expected.to have_db_column :total_deposit}
 end
 describe '#validation of user attributes' do
     it { is_expected.to validate_presence_of(:id_number) }
     it { is_expected.to validate_presence_of(:phone_number) }
     it { is_expected.to validate_presence_of(:new_deposit) }
     it { is_expected.to validate_presence_of(:total_deposit) }
     it "raises database error when user attributes are null" do
         valid_user_attrs = { id_number: 1234567, phone_number: "0700000000",new_deposit: 1234, total_deposit: "5478"}
         user_without_id_number_attr =   valid_user_attrs.slice(:phone_number, :new_deposit, :total_deposit)
         user_without_id_number = User.new(user_without_id_number_attr)
          expect { user_without_id_number.save!(validate: false)}.to raise_error(ActiveRecord::NotNullViolation)
          user_without_phone_number_attr =   valid_user_attrs.slice(:id_number,:new_deposit, :total_deposit)
          user_without_phone_number = User.new(user_without_phone_number_attr)
          expect { user_without_phone_number.save!(validate: false)}.to raise_error(ActiveRecord::NotNullViolation)
    end
end
 describe "#creating deposits" do
    it 'creates deposits with valid attributes' do
      deposit = FactoryBot.create(:deposit) 
      expect(user.phone_number).to eq '0700000000000'
      expect(user.balance).to eq (user.total_deposit)
      expect(user.pin).to eq 1234 
    end
    it "does not allow existing phone number" do
        FactoryBot.create(:deposit) # we create user
        user = FactoryBot.build(:deposit, phone_number:  "070000000000", id_number: "0000008") 
        user.save
        expect(user).not_to be_valid 
        expect(user.errors.messages[:phone_number]).to eq ["has already been taken"] 
      end
end
end
