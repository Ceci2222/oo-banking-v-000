require 'pry'
class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  
  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    sender.valid? && receiver.valid?
  end
  
  def execute_transaction
    if sender.valid? == false
      binding.pry
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif (valid? == true) && (@status == "pending")
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    end
  end
    
    def reverse_transfer
      if @status == "complete"
        sender.balance += amount
        receiver.balance -= amount
        @status = "reversed"
      end  
    end
end
