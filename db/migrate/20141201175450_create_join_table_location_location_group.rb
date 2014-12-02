class CreateJoinTableLocationLocationGroup < ActiveRecord::Migration
  def change
    create_join_table :locations, :location_groups do |t|
       t.index [:location_id, :location_group_id], :name => 'index_loc_loc_group'
       t.index [:location_group_id, :location_id], :name => 'index_loc_group_loc'
    end
  end
end
