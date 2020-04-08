class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  def valid?
    if @sender.valid? && @receiver.valid?
      if @sender.balance > @amount && @receiver.balance > @amount
      return TRUE
    end
    else
      FALSE
    end
  end
  def execute_transaction
    if self.valid? && @status == "pending"
      @sender.deposit(0-@amount)
      @receiver.deposit( @amount)
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit(0-@amount)
      @status = "reversed"
    end
  end
end
