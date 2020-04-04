require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status, :count

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
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
    if @status == "complete"
      @sender.deposit( @amount ) 
      @receiver.deposit( @amount * -1)
      @status = "reversed"
    end
  end

end
