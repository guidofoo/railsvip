class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :image
      t.string :titulo
      t.references :customer

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
