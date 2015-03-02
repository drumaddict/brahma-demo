class Thing < ActiveRecord::Base
   include FriendlyId
    friendly_id :title, :use => [:slugged, :finders]
   belongs_to :type
end

# == Schema Information
#
# Table name: things
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  slug        :string(255)      not null
#  description :string(255)
#  published   :boolean          default("0")
#  featured    :boolean          default("0")
#  created_at  :datetime
#  updated_at  :datetime
#  type_id     :integer
#
# Indexes
#
#  index_things_on_type_id  (type_id)
#
