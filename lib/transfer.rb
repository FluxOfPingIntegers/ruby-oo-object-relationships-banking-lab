require 'pry'
class Transfer
attr_reader :sender, :receiver, :amount
attr_accessor :status



  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    if @status == "pending"
    #  binding.pry
      if (@sender.balance - @amount) < 0 || self.valid? == false
        @status=("rejected")
        "Transaction rejected. Please check your account balance."
      else self.valid?
        money_to = 0 + @amount
        money_from = 0 - @amount
        @sender.deposit(money_from)
        @receiver.deposit(money_to)
        @status=("complete")
      end
    end
  end

  def reverse_transfer
    if @status == "complete"
      money_to = 0 + @amount
      money_from = 0 - amount
      @sender.deposit(money_to)
      @receiver.deposit(money_from)
      @status=("reversed")
    end
  end

end
