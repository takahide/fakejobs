class AddActiveToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :active, :integer
  end
end
