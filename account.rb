require_relative 'owner'
require 'csv'
module Bank

  class Account

    attr_accessor :initial_balance, :user_id

    def initialize(id, balance, date)
      @user_id = id
      @initial_balance = balance
      if balance > 0
        @initial_balance = balance
      else
        raise ArgumentError.new("Your initial balance cannot be less than zero")
      end
      @date_created = date
      @current_balance = 0
      @account_info = ""
    end

    def self.all
      open_account = {}
      accounts = []
      CSV.open('/Users/ShariMeggs/ada/Classwerk/BankAccounts/support/accounts.csv','r').each do |item|
        open_account[item[0]] = item[1..2]
        id = item[0].to_i
        balance = (item[1].to_i/100)
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


Bank::Account.all
Bank::Account.find(1212)
