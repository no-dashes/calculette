class AddVerifiedToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :verified, :boolean, default: false
    add_column :users, :verification_token, :string
  end
end
