require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should have valid Factory' do
    expect(FactoryBot.create(:user)).to be_valid
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
    it { is_expected.to validate_format_of(:first_name)} 
    it { is_expected.to validate_presence_of(:last_name)}
    it { is_expected.to validate_length_of(:last_name)}
    it { is_expected.to validate_format_of(:last_name)}
    it { is_expected.to validate_presence_of(:id_number)
    it { is_expected.to validate_uniqueness_of(:id_number)}
    it { is_expected.to validate_length_of(:id_number)}
    it { is_expected.to validate_presence_of(:phone_number)}
    it { is_expected.to validate_uniqueness_of(:phone_number)}
    it { is_expected.to validate_length_of(:phone_number)}
    it { is_expected.to validate_format_of(:phone_number)} 
    
    it { is_expected.to validate_presence_of(:password)}
    it { is_expected.to validate_length_of(:password)}
    it { is_expected.to validate_presence_of(:pin)}
    it { is_expected.to validate_length_of(:pin)}
  end
  it "raise database error when user attributes are null" do
    valid_user_attrs = { first_name: "Jane", last_name: "Doe", id_number: 1234567, phone_number: "0700000000", pin: 1234, password: "PassWord@123."}
    user_without_first_name_attr =   valid_user_attrs.slice(:last_name,:id_number,:phone_number, :pin, :password)
    user_without_first_name = User.new(user_without_first_name_attr)
    expect { user_without_first_name.save!(validate: false)}.to raise_error(ActiveRecord::NotNullViolation)
    user_without_last_name_attr =   valid_user_attrs.slice(:first_name,:id_number,:phone_number, :pin, :password)
    user_without_last_name = User.new(user_without_last_name_attr)
    expect { user_without_last_name.save!(validate: false)}.to raise_error(ActiveRecord::NotNullViolation)
  end
  describe "#creating user" do
    it 'creates user with valid attributes' do
      user = FactoryBot.create(:user) # we create user , insert him on the database
      expect(user.first_name).to eq 'John' # we ensure his name is John since that is what is in the factory
      expect(user.balance).to eq 0.0 # we assert that the user created has a balance of 0.0 remember default value of balance is 0.0
      expect(user.pin).to eq 1234 # we assert that the pin for user created is 1234
    end
    it "do not allow existing phone number" do
      FactoryBot.create(:user) 
      user = FactoryBot.build(:user, phone_number:  "070000000000", id_number: "0000000") # we build a ?# user factory with existing phone number
      user.save 
      expect(user).not_to be_valid 
      expect(user.errors.messages[:phone_number]).to eq ["has already been taken"] 
    end
    it "do not allow phone number that is not digit" do
      user = FactoryBot.build(:user, phone_number: "abc12345679") # we build factory for user with non-digit only phone number
      user.save    # save the factory
      expect(user).not_to be_valid # we test that it is not valid
      expect(user.errors.messages[:phone_number]).to eq ["is not a number"] # # we test that error we get from phone number is "["is not a number"]"
    end it "do not allow phone number that are less than 10" do
      user = FactoryBot.build(:user, phone_number: "12345678")
      user.save        
      expect(user.errors.messages[:phone_number]).to eq ["is too short (minimum is 10 characters)"]
    end
    it "do not allow phone number that is greater than 13" do
      user = FactoryBot.build(:user, phone_number: "12345678910112221")
      user.save
      expect(user.errors.messages[:phone_number]).to eq ["is too long (maximum is 13 characters)"]
    end
    it "do not allow id number that are less than 7" do
      user = FactoryBot.build(:user, id_number: "12345")
      user.save        
      expect(user.errors.messages[:id_number]).to eq ["is too short (minimum is 7 characters)"]
  end
  it "do not allow id number that are greater than 9" do
    user = FactoryBot.build(:user, id_number: "1234567894")
    user.save        
    expect(user.errors.messages[:id_number]).to eq ["is too long (maximum is 9 characters)"]
  end
  it "do not allow letters or symbols" do
    user = FactoryBot.build(:user,id_number: "1234567a"{ with: /\A[a-zA-Z]+\z/})
    user.save        
    expect(user.errors.messages[:id_number]).to eq ["is invalid(only letters allowed)"]
  end
  it "do not allow duplicate id numbers" do
    user = FactoryBot.build(:user,id_number: "12345694")
    user.save        
    expect(user.errors.messages[:id_number]).to eq ["is invalid(the id number is already registered)"]
  end
  it "do not allow password characters that are less than 8" do
    user = FactoryBot.build(:user, password: "123")
    user.save        
    expect(user.errors.messages[:password]).to eq ["is too short (minimum is 8 characters)"]
  end
  it "do not allow password characters that are greater than 8" do
    user = FactoryBot.build(:user, password: "123456789")
    user.save        
    expect(user.errors.messages[:password]).to eq ["is too long (maximum is 8 characters)"]
  end
  it "do not allow password without special characters" do
    user = FactoryBot.build(:user, password_confirmation: "123")
    user.save        
    expect(user.errors.messages[:password]).to eq ["is too long (maximum is 8 characters)"]
  end
  it "do not allow password that do not match" do
    user = FactoryBot.build(:user, password_confirmation:"")
    user.save        
    expect(user.errors.messages[:password_confirmation]).to eq ["is invalid (passwords do not match!)"]
  end

end
