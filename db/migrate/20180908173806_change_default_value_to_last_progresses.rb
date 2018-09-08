class ChangeDefaultValueToLastProgresses < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :last_progresses, :text, :default => {"#{Time.now}": "0.0"}.to_yaml
  end
end
