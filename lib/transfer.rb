class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  def initialize(sender, receiver, amt)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amt
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def have_monies?
    if @sender.balance >= @amount
      true
    else
      false
    end
  end

  def execute_transaction
    if self.status == "pending" && self.have_monies?
      @sender.balance -= @amount
      @receiver.balance += @amount
      self.status = "complete"
    else
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      @receiver.balance -= @amount
      @sender.balance += @amount
      self.status = "reversed"
    else

    end
  end
end
