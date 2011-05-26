class AddCreditCardToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :credit_card, :integer
  end

  def self.down
    remove_column :orders, :credit_card
  end
end
