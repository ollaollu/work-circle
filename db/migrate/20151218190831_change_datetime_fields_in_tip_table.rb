class ChangeDatetimeFieldsInTipTable < ActiveRecord::Migration
  def up
   change_column :tips, :game_time, :time
   change_column :tips, :tip_date, :date
  end

  def down
   change_column :tips, :game_time, :datetime
   change_column :tips, :tip_date, :datetime
  end
end
