class Link < ActiveRecord::Base
  validates_presence_of :ref
  validates_presence_of :text
  validates_format_of :ref, :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix, :on => :create, :message => "must start with http:// or https://"
  
end


