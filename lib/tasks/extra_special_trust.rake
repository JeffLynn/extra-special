
namespace :extra_special_trust do

  desc "Update media items"
  task :update_media_items => :environment do
    MediaItem.all.each do |item|
      item.create_attachment_hash
      item.save!
    end
  end

end