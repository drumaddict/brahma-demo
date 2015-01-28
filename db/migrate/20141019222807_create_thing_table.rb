class CreateThingTable < ActiveRecord::Migration
def self.up
  create_table :things do |t|
    t.string  :title
    t.string  :description
    t.boolean :published, default: false
    t.boolean :featured, default: false
    t.timestamps
  end
end

  def self.down
    drop_table :things
  end

end




