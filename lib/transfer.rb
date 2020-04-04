class Transfer
  attr_accessor :sender, :receiver, :amount, :status


  def initialize(sender, receiver, amount)
    @sender, @receiver, @amount = sender, receiver, amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance > @amount
  end

  def execute_transaction
    if valid? && status == "pending"
      @sender.balance -= @amount 
      @receiver.balance += @amount 
      @status = "complete"
    elsif !valid? && @status == "pending"
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    else
      @status = "rejected"

    end
  end

end
