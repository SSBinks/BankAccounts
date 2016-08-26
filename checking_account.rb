require_relative 'account'
require 'csv'

module Bank

  class CheckingAccount < Account

    def initialize( id, balance, date)
      super
      @fee = 100.0
      @cheques = 0
    end

    def withdraw(balance)
      if (@current_balance - balance) - @fee  > MIN
        @current_balance = (@current_balance - balance) - @fee
        return penny_to_dollars(@current_balance)
      else
        @current_balance = @current_balance
        raise ArgumentError.new("You are about to make a poor life decision and must be stopped your balance is still #{penny_to_dollars(@current_balance)}")
      end
    end

    def withdraw_using_check(amount)
      overdraft_limit = -800
      use_check = @current_balance - amount
      if use_check > overdraft_limit
        @cheques += 1
        if @cheques > 3
          @current_balance = use_check - (@fee * 2)
          return "Current balance #{penny_to_dollars(@current_balance)} with a $#{penny_to_dollars(@fee)} fee applied since you have used #{@cheques} checks!"
        end
        @current_balance = use_check
        return "Current balance #{penny_to_dollars(@current_balance)} and you have used #{@cheques} check(s) this month!"
      else
        @current_balance = @current_balance
        raise ArgumentError.new("You are about to make a poor life decision and must be stopped your balance is still #{penny_to_dollars(@current_balance)} and you have used #{@cheques} checks.")
      end
    end
  end
end
