class BankAccount

 attr_accessor :balance, :status 
 attr_reader :name 

  @@all = [ ]
 
   def initialize(name)
    @name = name 
    @balance = 1000 
    @status = "open"
    @@all << self 
   end 
  
   def self.all 
    @@all 
    end 

    def deposit(money)
    self.balance = balance + money 
    end 

   def display_balance 
    return "Your balance is $#{balance}."
   end 


   def valid?
     balance > 0  && self.status == "open"
    end  
   
    def close_account 
        self.status = "closed"
    end 
      










end 
