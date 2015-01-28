class AddTypeRefToThings < ActiveRecord::Migration
  def change
    add_reference :things, :type, index: true
  end
end
