class ChangeDefaultValueOfLastProgresses < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :last_progresses, :text
  end
end
