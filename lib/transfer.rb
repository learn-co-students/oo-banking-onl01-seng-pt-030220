require 'pry'
class Transfer
  attr_reader 
  attr_accessor :status, :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender, @receiver, @amount = sender, receiver, amount
    @status = 'pending'
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.sender.balance > amount && valid? && status == 'pending'
      self.status = 'complete'
      self.sender.balance -= amount
      self.receiver.balance += amount
    else
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == 'complete'
      self.status = 'reversed'
      self.sender.balance += amount 
      self.receiver.balance -= amount 
    end
  end

end