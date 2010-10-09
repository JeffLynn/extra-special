class Link < ActiveRecord::Base
  validates_presence_of :ref
  validates_presence_of :text
end
