require_relative 'account'
require 'csv'

module Bank

  class SavingsAccount < Account
    MIN = 1000.0

    def initialize( id, balance, date)
      super

      if balance > MIN
        @current_balance = balance
      else
        raise ArgumentError.new("You can't let your account drop that low! This isn't limbo!")
      end
    end

      def withdraw (balance)
        if (@current_balance - balance) - 200.0  > MIN
        @current_balance = (@current_balance - balance - 200.0)
          return @current_balance
        else
          @current_balance = @current_balance
          raise ArgumentError.new("You are about to make a poor life decision and must be stopped
          your balance is still #{penny_to_dollars(@current_balance)}")
        end
      end

      def add_interest(rate)
        interest_rate = @current_balance * (rate/100.0).to_f
        @current_balance = @current_balance + interest_rate
        return "Your updated balance is #{penny_to_dollars(@current_balance)} and You have earned #{interest_rate} in interest!"
      end
  end
end

shari = Bank::SavingsAccount.new(21, 9000, 2008)
shari.withdraw(15)
