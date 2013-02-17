class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_protected :crypted_password, :salt
  
  validates_confirmation_of :password
  #validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  def self.find_or_create_from_auth_hash(auth_hash)
  	Rails.logger.debug(auth_hash.to_yaml)
  	Rails.logger.debug(auth_hash.extra.raw_info.other_services.twitter.identifier)
  	auth = Authentication.find_or_initialize_by_provider_and_uid(auth_hash.provider, auth_hash.uid.to_s)
    if auth.new_record?
      auth.token = auth_hash.token
      auth.refresh_token = auth_hash.refresh_token
      auth.expires_at = auth_hash.expires_at if auth_hash.expires
      auth.meta = auth_hash.extra.raw_info
      auth.user = User.find_or_create_by_email("#{auth_hash.provider}-#{auth_hash.uid}@headstartaus.com.au")
      auth.save!
    end

    auth.user.avatar_url = auth_hash.info.photo_url
    auth.user.bio = auth_hash.info.description
    name = auth_hash.info.name.split(' ')
    auth.user.first_name = name[0]
    auth.user.last_name = name[1..-1].join(' ')
    services = auth_hash.extra.raw_info.other_services
    auth.user.twitter_name = services.twitter.identifier[1..-1] if services.twitter
    auth.user.linkedin_url = services.linkedin.identifier if services.linkedin
    auth.user.facebook_id = services.facebook.identifier if services.facebook
    auth.user.save!

    auth.user
  end

  def full_name
  	"#{first_name} #{last_name}"
  end

end
