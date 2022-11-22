class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    change_table :group_expenses do |t|
      t.rename :groups_id, :group_id
    end
  end
end
