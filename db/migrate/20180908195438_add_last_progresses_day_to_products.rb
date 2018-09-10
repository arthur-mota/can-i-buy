class AddLastProgressesDayToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :last_progresses_day, :text
  end
end
