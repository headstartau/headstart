class Authentication < ActiveRecord::Base
  belongs_to :user
  store :meta
  attr_accessible :expires_at, :meta, :provider, :refresh_token, :token, :uid
end
