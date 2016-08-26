require_relative 'account'
require 'csv'

module Bank
#Still need to add option 2! Possibly create a method that will automatically add an author
  class Owner
    attr_accessor :address, :city, :state
    attr_reader :ssn, :last_name, :first_name

    def initialize(ssn, last_name, name, address, city, state)
      @ssn = ssn
      @last_name = last_name
      @first_name = name
      @address = address
      @city = city
      @state = state
    end

    def self.all
      account_holder = {}
      accounts = []
      CSV.open('/Users/ShariMeggs/Documents/ada/Wave-Projects/BankAccounts/BankAccounts/support/owners.csv','r').each do |person|
        account_holder[person[0]] = person[1..5]
        ssn = person[0].to_i
        last_name = person[1]
        first_name = person[2]
        address = person[3]
        city = person[4]
        state = person[5]
        accounts << self.new(ssn, last_name, first_name, address, city, state)
      end
      return accounts
    end

    def self.find(user)
      user_search = self.all
      user_search.each do |peeps|
        if peeps.ssn == user
          return peeps
        end
      end
    end

    def to_s
      return "Last Name: ##{@last_name} \n First Name: #{@first_name} \n Street Address: #{@address} \n City: #{@city} State: #{@state}"
    end

  end
end
