
module ZipCodeHelper
  def valid?(zip_code)
   unless (zip_code.nil?)
      return  !zip_code.match(/^[0-9]{5}$/).nil?
    end
    false
  end
end