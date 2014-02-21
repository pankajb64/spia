class CreatePads < ActiveRecord::Migration

  def up
    create_table :pads do |t|
      t.string :base36_id # base 64 id
      t.text :contents # contents of the pad
      t.timestamps    #ActiveRecord maintains two timestamps, create_at and upadted_at
    end
  end
  
  def down
    drop_table :pads
  end
  
end        
