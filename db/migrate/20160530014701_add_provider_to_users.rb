class AddProviderToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provide, :string
  end
end
