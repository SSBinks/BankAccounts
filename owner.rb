require_relative 'account'

module Bank
#Still need to add option 2! Possibly create a method that will automatically add an author
  class Owner
    attr_accessor :name, :dob, :address, :city, :state

    def initialize
      @name = name
      @user_id = id
      @dob = birth_date
      @address = address
      @city = city
      @state = state
    end

    def to_s
      puts "name: #{name} \n Date of birth: #{dob} \n Street Address: #{address} \n City: #{city}
      State: #{state}"
    end

  end
end
