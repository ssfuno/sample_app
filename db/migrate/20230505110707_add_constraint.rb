class AddConstraint < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :email, false
    change_column_null :users, :name, false
    change_column_null :users, :password, false
    change_column_null :users, :password_confirmation, false
    change_column_null :recipes, :title, false
    change_column_null :recipes, :matreial, false
    change_column_null :recipes, :process, false
  end
end
