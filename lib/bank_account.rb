class BankAccount
  attr_reader :balance, :name, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amt)
    @balance += amt
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    if self.status == "closed"
      return false
    elsif self.balance < 1
      return false
    else
      return true
    end
  end

  def close_account
    @status = "closed"
  end

  def balance=(amt)
    #should balance be set-able?
    @balance = amt
  end

  def status=(status)
    @status = status
  end
end
