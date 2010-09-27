# == Schema Information
#
# Table name: stories
#
#  id                   :integer(4)      not null, primary key
#  name                 :string(255)
#  title                :string(255)
#  body                 :text
#  created_at           :datetime
#  updated_at           :datetime
#  picture_file_name    :string(255)
#  picture_content_type :string(255)
#  picture_file_size    :integer(4)
#  picture_updated_at   :datetime
#

class Story < ActiveRecord::Base
  has_attached_file :picture,
    :styles => {:banner => '519x233#',
               :thumbnail => '111x50#'
    }

  validates_presence_of :name
  validates_presence_of :title
  validates_presence_of :body
  # 519X233
  validates_attachment_presence :picture
end
