require 'ostruct'
require 'json'

module JsonHelper
  def json_to_openstruct(json_string)
    JSON.parse(json_string, object_class: OpenStruct)
  rescue JSON::ParserError
     nil
  end
end
