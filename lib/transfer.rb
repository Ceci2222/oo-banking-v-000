class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :money
  
  def initialize (sender, money, receiver)
    @status = "pending"
  end
  
  
end
