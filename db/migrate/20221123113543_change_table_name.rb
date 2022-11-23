class ChangeTableName < ActiveRecord::Migration[7.0]
  def change
    rename_table :group_expenses, :expenses_groups
  end
end
