class Thing < ActiveRecord::Base
   include FriendlyId
    friendly_id :title, :use => [:slugged, :finders]
   belongs_to :type
end