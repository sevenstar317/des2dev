class AddBillingFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :company, :string
    add_column :users, :country_code, :string
    add_column :users, :state, :string
    add_column :users, :city, :string
    add_column :users, :address, :string
    add_column :users, :address_2, :string
    add_column :users, :zip_code, :string
    add_column :users, :phone, :string
    add_column :users, :billing_email, :string
  end
end
