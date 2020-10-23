class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?()
    (@sender.valid? && @sender.balance > amount) && (@receiver.valid?) ? true : false
  end
  
  def execute_transaction()
    if ((@status == "pending") && (valid?()))
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer()
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit(-@amount)
      @status = "reversed"
    end
  end
end
