class AddMilesToUser < ActiveRecord::Migration
  def change
    add_column :users, :miles, :integer, default: 0
  end
end
