class Transfer
  attr_accessor :status,
  attr_reader :sender, :receiver, :amount
  
  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    sender.bank_account.valid?  && receiver.bank_account.valid?
  end
  
  def execute_transaction
    if valid? == true
      sender.bank_account.balance -= amount
      receiver.bank_account.balance += amount
      @status = "complete"
    else
      @status = "rejected"
    end
  end
    
    def reverse_transfer
        @status == "complete"
        sender.bank_account.balance += amount
        receiver.bank_account.balance -= amount
        @status = "reversed"
    end  
end
