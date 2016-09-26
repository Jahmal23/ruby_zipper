require 'ostruct'
require 'json'

module JsonHelper
  def json_to_openstruct(json_string)

    if (json_string.nil?)
      return nil
    end

    JSON.parse(json_string, object_class: OpenStruct)
  rescue JSON::ParserError
     nil
  end
end
