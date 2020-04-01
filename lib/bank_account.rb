require_relative "transfer.rb"
require 'pry'
class BankAccount
  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    self.balance += amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    self.status == "open" && self.balance > 0
  end

  def close_account
    self.balance = 0
    self.status = "closed"
  end

end

# marcos = BankAccount.new("Marcos")
# vanessa = BankAccount.new("Vanessa")

# puts marcos.display_balance
# puts vanessa.display_balance
# puts "========="

# marcos.deposit(2500)
# vanessa.deposit(1200)
# puts marcos.display_balance
# puts vanessa.display_balance
# puts "========="

# send = Transfer.new(marcos, vanessa, 1500)
# send.execute_transaction
# puts marcos.display_balance
# puts vanessa.display_balance

# marcos.close_account
# puts marcos.display_balance