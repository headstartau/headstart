class UserFields < ActiveRecord::Migration
  def change
  	add_column :users, :startup_name, :string
  	add_column :users, :startup_blurb, :text
  	add_column :users, :startup_url, :string
  	add_column :users, :startup_logo_url, :string
  	add_column :users, :avatar_url, :string
  	add_column :users, :bio, :text
  	add_column :users, :twitter_name, :string
  	add_column :users, :linkedin_url, :string
  	add_column :users, :facebook_id, :string
  end
end
