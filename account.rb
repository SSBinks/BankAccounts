require_relative 'owner'
require 'csv'
module Bank

  class Account

    attr_accessor :initial_balance, :user_id
    MIN = 0

    def initialize(id, balance, date)
      @user_id = id
      if balance > MIN
        @current_balance = balance
      else
        raise ArgumentError.new("Your initial balance cannot be less than zero")
      end
      @date_created = date

      @account_info = ""
    end


    def self.all
      open_account = {}
      accounts = []
      CSV.open('/Users/ShariMeggs/Documents/ada/Wave-Projects/BankAccounts/BankAccounts/support/accounts.csv','r').each do |item|
        open_account[item[0]] = item[1..2]
        id = item[0].to_i
        balance = (item[1].to_f)
        date = item[2]
        accounts << self.new(id, balance, date)
      end
      return accounts
    end

    def self.find(id)
      id_find = self.all
      id_find.each do |i|
        if i.user_id == id
          return i
        end
      end
    end


    def add_owner (owner)
      @account_info = "#{@owner}: #{@user_id}, #{@current_balances}"
    end

    def withdraw(balance)
      if @current_balance - balance < MIN
        puts "We are unable to process this request. Do not allow your account to go negative!"
        return penny_to_dollars(@current_balance)
      end
      @current_balance = @current_balance  - balance
      return penny_to_dollars(@current_balance)
    end

    def deposit(balance)
      @current_balance = @current_balance + balance
      return penny_to_dollars(@current_balance)
    end

    def penny_to_dollars (money)
      money = money/100.0
      return money
    end

  end
end


Bank::Account.all
Bank::Account.find(1212)
