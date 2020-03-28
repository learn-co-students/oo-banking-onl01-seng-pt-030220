class Transfer
  # your code here

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender, @receiver, @amount, @status = sender, receiver, amount, 'pending'

  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if self.status != 'complete' && valid? && self.sender.balance > self.amount
      self.receiver.deposit(self.amount)
      self.sender.withdrawl(self.amount)
      self.status = 'complete'
    else
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == 'complete'
      self.sender.deposit(self.amount)
      self.receiver.withdrawl(self.amount)
      self.status = 'reversed'
    end

  end

end
