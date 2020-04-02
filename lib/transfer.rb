class Transfer

  attr_accessor :status
  attr_reader   :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    if sender.valid? == receiver.valid?
      true
    end
  end

  def execute_transaction
    if self.valid? && self.sender.balance > self.amount && self.status == "pending"
    self.sender.balance -= self.amount
    self.receiver.balance += self.amount
    self.status = 'complete'
    else
      @status = "rejected"
    return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = 'reversed'
    end
  end
end

