class AddIconToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :icon, :string
  end
end
