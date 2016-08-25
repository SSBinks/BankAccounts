require_relative 'account'
require 'csv'

module Bank

  class SavingsAccount < Account

    def initialize( id, balance, date)
      super
      @interest =  1/4
      if balance > 10
        @initial_balance = balance
      else
        raise ArgumentError.new("You can't let your account drop that low! This isn't limbo!")
      end

      def withdraw (balance)
        min = 10
        if (@initial_balance - balance) - 2  > min
        @current_balance = (@initial_balance - balance) - 2
          return @current_balance
        else
          @current_balance = @initial_balance
          raise ArgumentError.new("You are about to make a poor life decision and must be stopped
          your balance is still #{@current_balance}")
        end
      end


    end
  end
end

shari = Bank::SavingsAccount.new(21, 9000, 2008)
shari.withdraw(15)
