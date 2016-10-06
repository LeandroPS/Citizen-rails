class AddDataToCausas < ActiveRecord::Migration[5.0]
  def change
    add_column :causas, :data, :date
  end
end
