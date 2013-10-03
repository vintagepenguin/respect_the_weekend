class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string     :name
      t.text       :description
      t.string     :url
      t.string     :address 
      t.time       :start_time
      t.references :creator
      t.datetime   :date 
    end 
  end
end
