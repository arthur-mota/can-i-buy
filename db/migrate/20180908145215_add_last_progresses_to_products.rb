class AddLastProgressesToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :last_progresses, :text
  end
end
