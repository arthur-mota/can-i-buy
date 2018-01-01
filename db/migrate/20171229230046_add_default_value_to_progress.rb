class AddDefaultValueToProgress < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :progress, :float, :default => 0.0
  end
end
