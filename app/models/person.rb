class Person
  attr_accessor :first_name
  attr_accessor :last_name
  attr_accessor :address
  attr_accessor :city
  attr_accessor :zip
  attr_accessor :phone_number


  def initialize(first_name, last_name, address, city, zip, phone_number = nil)
    @first_name = first_name
    @last_name = last_name
    @address = address
    @city = city
    @zip = zip
    @phone_number = phone_number
  end

end