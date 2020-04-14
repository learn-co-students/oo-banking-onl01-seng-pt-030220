class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if @sender.valid? and @receiver.valid?
       return true
    else
      return false
    end
  end

  def execute_transaction
    if @sender.balance > @amount && @sender.valid? && @status == "pending" && @receiver.valid?
       @sender.balance -= @amount
       @receiver.balance += @amount
       @status = "complete"
    else
      @status = "rejected"
      return  "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
     end
   end
  end
