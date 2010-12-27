class CreateCarts < ActiveRecord::Migration
  def self.up
    create_table :carts do |t|
      t.string :name
      t.string :price

      t.timestamps
    end
  end

  def self.down
    drop_table :carts
  end
end
