require "pry"
class Transfer
  # acts as a space for a transaction between two instances of the bank account class.
  #Transfer instances should be able to reject a transfer
  #if the accounts aren't valid or if the sender doesn't have the money

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
    # self.sender = BankAccount.new # @sender=#<BankAccount:0x00 @name="">
    # self.receiver = BankAccount.new
    #<Transfer:0x00 @sender="", @receiver=""
  end

  def execute_transaction
    # transfer = Transfer.new(@sender, @receiver, @amount)
    # if transfer.valid? &&
    if (@sender.valid? && @receiver.valid?) && @sender.balance > @amount && @status == "pending"#(each transfer can only happen once)
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    # elsif (!@sender.valid? || !@receiver.valid?) && (@sender.balance < @amount || @sender.status == "closed") && @status == "pending"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
# binding.pry
  end

  def reverse_transfer
    # binding.pry
    if @status == "complete" && (@sender.valid? && @receiver.valid?) && @receiver.balance > @amount
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"

    end
    #
  end
end
