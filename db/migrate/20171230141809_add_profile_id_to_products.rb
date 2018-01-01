class AddProfileIdToProducts < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :profile, foreign_key: true
  end
end
