class CreateRElationships < ActiveRecord::Migration
  def change
    create_table :r_elationships do |t|
      t.references :follower, index: true
      t.references :followed, index: true

      t.timestamps null: false
      
      t.index [:follower_id, :followed_id], unique: true
    end
  end
end
