class AddProviderToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :uid, :string, default: ""
    add_column :users, :provider, :string, default: ""
  end
end
