class Transfer
  
  attr_accessor :status 
  attr_reader :sender, :amount, :receiver


  def initialize(sender, receiver, amount)  
   @amount = amount 
    @sender = sender 
    @receiver = receiver 
    @status = "pending"
  end 

 

   def valid?
    sender.valid? && receiver.valid? 
  end 

   def execute_transaction 
       if valid? && sender.balance > amount && status == "pending"
         sender.balance -= amount
         receiver.balance += amount 
         self.status = "complete"
       else 
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end 
   end 

    def reverse_transfer 
      if valid?  && receiver.balance > amount && status == "complete"
         sender.balance += amount 
         receiver.balance -= amount
         self.status = "reversed"
      else  
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end 
    end 














end
