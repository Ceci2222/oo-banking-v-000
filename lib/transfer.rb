class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  
  def initialize (sender, amount, receiver)
    @sender = sender
    @amount = amount
    @receiver = receiver
    @status = "pending"
  end
  
  def valid?
    sender.bank_account.valid?  && receiver.bank_account.valid?
  end
  
  def execute_transaction
    if valid? == true
      sender.bank_account.balance -= amount
      receiver.bank_account.balance += amount
      @status = 
  
end
