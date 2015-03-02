class Type < ActiveRecord::Base
  include FriendlyId
  friendly_id :title, :use => [:slugged, :finders]
  has_many :things, dependent: :destroy
  accepts_nested_attributes_for :things, allow_destroy: true
end

# == Schema Information
#
# Table name: types
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  slug        :string(255)      not null
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#
