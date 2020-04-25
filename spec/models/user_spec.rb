require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should have valid Factory' do
   expect(FactoryBot.create(:user)).to be_valid
  end
  describe '#user table column' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :first_name }
    it { is_expected.to have_db_column :last_name }
    it { is_expected.to have_db_column :phone_number }
    it { is_expected.to have_db_column :pin }
    it { is_expected.to have_db_column :id_number }
    it { is_expected.to have_db_column :balance }
  end
  describe '#validation of user attributes' do
    it { is_expected.to validate_presence_of(:first_name)}
    it { is_expected.to validate_length_of(:first_name)} 
    it { is_expected.to validate_presence_of(:last_name)}
    it { is_expected.to validate_length_of(:last_name)}
    it { is_expected.to validate_presence_of(:id_number)}
    it { is_expected.to validate_length_of(:id_number)}
    it { is_expected.to validate_presence_of(:phone_number)}  
    it { is_expected.to validate_length_of(:phone_number)}
    it { is_expected.to validate_numericality_of(:phone_number)}
    it { is_expected.to validate_presence_of(:password)}
    it { is_expected.to validate_length_of(:password)}
    it { is_expected.to validate_confirmation_of(:password)}
    it { is_expected.to validate_presence_of(:pin)}
    it { is_expected.to validate_length_of(:pin)}
    it { is_expected.to validate_numericality_of(:pin)}
    it { is_expected.to validate_presence_of(:password_confirmation)}
      subject{User.create(first_name: "nikki", last_name:"memphis",id_number:"45678925", phone_number:"0123456789",password:"123987654")}
    it { is_expected.to validate_uniqueness_of(:phone_number).case_insensitive}
    it { is_expected.to validate_uniqueness_of(:id_number).case_insensitive}
  end 
  describe "#creating user" do
    it 'creates user with valid attributes' do
      user = FactoryBot.create(:user) 
      expect(user.first_name).to eq 'John' 
      expect(user.balance).to eq 0.0 
      expect(user.pin).to eq 1234 
    end
    it "does not allow existing phone number" do
      FactoryBot.create(:user) 
      user = FactoryBot.build(:user, phone_number:  "0123456789", id_number: "0000000") 
      user.save 
      expect(user).not_to be_valid 
      expect(user.errors.messages[:phone_number]).to eq ["has already been taken"] 
    end
    it "does not allow phone number that is not a digit" do
      user = FactoryBot.build(:user, phone_number: "abc12345679") 
      user.save    
      expect(user).not_to be_valid 
      expect(user.errors.messages[:phone_number]).to eq ["is not a number"]
    end
    it "does not allow phone number that are less than 10" do
      user = FactoryBot.build(:user, phone_number: "12345678")
      user.save        
      expect(user.errors.messages[:phone_number]).to eq ["is too short (minimum is 10 characters)"]
    end
    it "does not allow phone number that is greater than 13" do
      user = FactoryBot.build(:user, phone_number: "12345678910112221")
      user.save
      expect(user.errors.messages[:phone_number]).to eq ["is too long (maximum is 13 characters)"]
    end
    it "does not allow id number that are less than 7" do
      user = FactoryBot.build(:user, id_number: "12345")
      user.save        
      expect(user.errors.messages[:id_number]).to eq ["is too short (minimum is 7 characters)"]
    end
    it "does not allow id number that are greater than 9" do
      user = FactoryBot.build(:user, id_number: "1234567894")
      user.save        
    expect(user.errors.messages[:id_number]).to eq ["is too long (maximum is 9 characters)"]
    end
    it "does not allow id number to contain letters" do
      user = FactoryBot.build(:user,id_number: "1234567a")
      user.save        
    expect(user.errors.messages[:id_number]).to eq ["is not a number"]
    end
    it "does not allow duplicate id numbers" do
    FactoryBot.create(:user)
     user = FactoryBot.build(:user,id_number: "12345678")
     user.save       
    expect(user.errors.messages[:id_number]).to eq ["has already been taken"]
    end
    it "does not allow password characters that are less than 8" do
      user = FactoryBot.build(:user, password: "123")
      user.save        
      expect(user.errors.messages[:password]).to eq ["too weak"]
    end
    it "does not allow password without special characters" do
      user = FactoryBot.build(:user, password: "123")
      user.save        
      expect(user.errors.messages[:password]).to eq ["too weak"]
    end
    it "does not allow password that do not match" do
      user = FactoryBot.build(:user, password_confirmation:"km45")
      user.save        
      expect(user.errors.messages[:password_confirmation]).to eq ["doesn't match Password"]
    end
  end
end