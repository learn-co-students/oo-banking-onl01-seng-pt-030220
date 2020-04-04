class Transfer
  # your code here


  attr_accessor :sender,:receiver,:status,:amount

  def initialize(sender,receiver, status="pending", amount)
    @sender, @receiver,@status, @amount = sender, receiver,status,amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
        sender.balance -= amount
        receiver.balance += amount
          self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if self.status == "complete"
    sender.balance += amount
    receiver.balance -= amount
    self.status = "reversed"
    end
  end

end
