
# todo phone number???

class PersonService

  include JsonHelper

  def get_persons(json_result)

    persons = []

    open_struct = json_to_openstruct(json_result)

    open_struct.results.each do |x|

      if has_valid_data?(x)
        p = Person.new(get_first_name(x),
                       get_last_name(x),
                       get_address(x),
                       get_city(x),
                       get_zip(x))

        persons << p
      end

    end

    persons

    end





  private

  def has_valid_data?(open_struct_result)
    has_location?(open_struct_result) &&
        has_legal_entity?(open_struct_result.locations[0]) &&
        has_a_name?(open_struct_result.locations[0].legal_entities_at[0])
  end

  def has_location?(open_struct_result)
    (!open_struct_result.locations.nil?) && (open_struct_result.locations.count > 0)
  end

  def has_legal_entity?(location)
    (!location.legal_entities_at.nil?) && (location.legal_entities_at.count > 0)
  end

  def has_a_name?(legal_entity)
    (!legal_entity.names.nil?) && (legal_entity.names.count > 0)
  end

  def get_first_name(open_struct_result)
    open_struct_result.locations[0].legal_entities_at[0].names[0].first_name
  end

  def get_last_name(open_struct_result)
    open_struct_result.locations[0].legal_entities_at[0].names[0].last_name
  end

  def get_address(open_struct_result)
    open_struct_result.locations[0].standard_address_line1
  end

  def get_city(open_struct_result)
    open_struct_result.locations[0].city
  end

  def get_zip(open_struct_result)
    open_struct_result.locations[0].postal_code
  end
end






