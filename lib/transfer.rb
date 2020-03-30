require 'pry'
class Transfer
  # your code here

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @status = "pending" 
    @amount = amount
  end

  def valid? 
    if sender.valid? && receiver.valid? 
      true 
    else
      false
    end
  end 

  def execute_transaction 
    if valid? && self.status == "pending" && sender.balance > self.amount
      receiver.deposit(self.amount)
      sender.balance = sender.balance - self.amount
      self.status = "complete"
    else 
    self.status = "rejected" 
    end      
    "Transaction rejected. Please check your account balance."
  end 

  def reverse_transfer 
  if self.status == "complete" && valid? 
    sender.balance = sender.balance + self.amount 
    receiver.balance = receiver.balance - self.amount 
    self.status = "reversed"
  else

  end

  end 

end
#dont touch => class end