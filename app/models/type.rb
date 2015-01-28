class Type < ActiveRecord::Base
  include FriendlyId
  friendly_id :title, :use => [:slugged, :finders]
  has_many :things, dependent: :destroy
  accepts_nested_attributes_for :things, allow_destroy: true
end