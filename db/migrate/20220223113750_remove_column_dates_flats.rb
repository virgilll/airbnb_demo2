class RemoveColumnDatesFlats < ActiveRecord::Migration[6.1]
  def change
    remove_column :flats, :dates
  end
end
