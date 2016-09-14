class AddCreatedByToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :created_by, :string, null: false
  end
end
