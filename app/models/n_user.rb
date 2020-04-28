class Nnuser < ApplicationRecord
    def self.find_or_create_from_auth_hash(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |nuser|
            nuser.provider = auth.provider
            nuser.uid = auth.uid
            nuser.first_name = auth.info.first_name
            nuser.last_name = auth.info.last_name
            nuser.email = auth.info.email        
            nuser.save!
        end
    end
end
