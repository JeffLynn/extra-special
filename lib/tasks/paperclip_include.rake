# This loads the paperclip rake tasks from the gem dir.
paperclip_gem_dir = nil
Dir["#{RAILS_ROOT}/vendor/gems/*"].each do |subdir|
  paperclip_gem_dir = subdir if subdir.gsub("#{RAILS_ROOT}/vendor/gems/","") =~ /^(\w+-)?paperclip-(\d+)/ && File.exist?("#{subdir}/tasks/paperclip_tasks.rake")
end

load "#{paperclip_gem_dir}/tasks/paperclip_tasks.rake" unless paperclip_gem_dir.nil?
