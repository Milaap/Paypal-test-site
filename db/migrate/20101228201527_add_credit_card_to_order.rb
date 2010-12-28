class AddCreditCardToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :type, :string
    add_column :orders, :number, :string
    add_column :orders, :verification_value, :string
    add_column :orders, :month, :integer
    add_column :orders, :year, :integer
    add_column :orders, :first_name, :string
    add_column :orders, :last_name, :string
    add_column :orders, :company, :string
    add_column :orders, :address1, :string
    add_column :orders, :city, :string
    add_column :orders, :state, :string
    add_column :orders, :country, :string
    add_column :orders, :zip, :string
    add_column :orders, :phone, :integer
  end

  def self.down
    remove_column :orders, :phone
    remove_column :orders, :zip
    remove_column :orders, :country
    remove_column :orders, :state
    remove_column :orders, :city
    remove_column :orders, :address1
    remove_column :orders, :company
    remove_column :orders, :last_name
    remove_column :orders, :first_name
    remove_column :orders, :year
    remove_column :orders, :month
    remove_column :orders, :verification_value
    remove_column :orders, :number
    remove_column :orders, :type
  end
end
