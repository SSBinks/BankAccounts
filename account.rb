module Bank
  class Account

    attr_accessor :initial_balance
    attr_writer :user_id

    def initialize(id, balance)
      @user_id = id
      @initial_balance = balance
      if balance > 0
        @initial_balance = balance
      else
        raise ArgumentError.new("Your initial balance cannot be less than zero")
      end
      @current_balance = 0
    end


    def withdraw (balance)
      @current_balance = @initial_balance - balance
      if @current_balance < 0
        puts "We are unable to process this request. Do not allow your account to go negative!"
        return @initial_balance
      end
      return @current_balance
    end

    def deposit(balance)
      @current_balance = @initial_balance + balance
      return @current_balance
    end

  end
end
