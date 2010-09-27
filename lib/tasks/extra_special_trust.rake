
namespace :extra_special_trust do

  desc "Update media items"
  task :update_media_items => :environment do
    MediaItem.all.each do |item|
      item.create_attachment_hash
      item.save!
    end
  end

  desc "add default user"
  task :create_admin => :environment do
    User.create!(:name => 'admin', :account => 'admin', :email => 'admin@unboxedconsulting.com', :password => 'l3tmein', :password_confirmation => 'l3tmein')
  end
end