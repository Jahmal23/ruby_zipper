class ZipCodeSearchService
  include ZipCodeHelper

  def get_zip_code_last_name_results(zip_code, list_of_names)
    results = []

    unless list_of_names.nil? ||
           list_of_names.count == 0 ||
           !valid?(zip_code)

      list_of_names.each do |n|
        search_url = build_api_url(zip_code, n.last, "6342ad6eeb5a7190c1898100237094c1")

        # This is stubbed out using WebMock to return fake_white_page_search_results in tests. see spec_helper.rb
        response = HTTParty.get(search_url)
        results << response.body unless response.nil?
      end
    end

    results
  end

  def build_api_url(zip_code, name, api_key)
    "https://proapi.whitepages.com/2.2/person.json?last_name=#{name}&postal_code=#{zip_code}&api_key=#{api_key}"
  end

  def self.empty_white_page_search_results
    '{ "results": [], "messages": [] }'
  end

  def self.fake_white_page_search_results
    '{
        "results": [
            {
                "id": {
                    "key": "Person.b3776faa-5a23-4b60-a7ed-13bd517a8593.Durable",
                    "type": "Person",
                    "durability": "Durable"
                },
                "names": [
                    {
                        "salutation": null,
                        "first_name": "Elias",
                        "middle_name": null,
                        "last_name": "Oliveira",
                        "suffix": null
                    }
                ],
                "age_range": null,
                "gender": null,
                "locations": [
                    {
                        "id": {
                            "key": "Location.561af1f2-364c-497b-a3e4-f47464959fc1.Durable",
                            "type": "Location",
                            "durability": "Durable"
                        },
                        "type": "Address",
                        "valid_for": null,
                        "legal_entities_at": [
                            {
                                "id": {
                                    "key": "Person.b3776faa-5a23-4b60-a7ed-13bd517a8593.Durable",
                                    "type": "Person",
                                    "durability": "Durable"
                                },
                                "names": [
                                    {
                                        "salutation": null,
                                        "first_name": "Elias",
                                        "middle_name": null,
                                        "last_name": "Oliveira",
                                        "suffix": null
                                    }
                                ],
                                "age_range": null,
                                "gender": null,
                                "locations": null,
                                "phones": null
                            },
                            {
                                "id": {
                                    "key": "Person.b2b1f49f-a8c4-480b-8c1c-124322cc642d.Durable",
                                    "type": "Person",
                                    "durability": "Durable"
                                },
                                "names": [
                                    {
                                        "salutation": null,
                                        "first_name": "Luiz",
                                        "middle_name": "Souza",
                                        "last_name": "Lima",
                                        "suffix": null
                                    }
                                ],
                                "age_range": null,
                                "gender": null,
                                "locations": null,
                                "phones": null
                            }
                        ],
                        "city": "New Orleans",
                        "postal_code": "70130",
                        "zip4": "5002",
                        "state_code": "LA",
                        "country_code": "US",
                        "is_receiving_mail": true,
                        "not_receiving_mail_reason": null,
                        "usage": "Residential",
                        "delivery_point": "SingleUnit",
                        "address_type": "Street",
                        "lat_long": {
                            "latitude": 29.93051,
                            "longitude": -90.073478,
                            "accuracy": "RoofTop"
                        },
                        "is_deliverable": true,
                        "standard_address_line1": "1928 Constance St",
                        "standard_address_line2": "",
                        "is_historical": false
                    }
                ],
                "phones": [
                    {
                        "id": {
                            "key": "Phone.18df6fef-a2e1-4b08-cfe3-bc7128b65a00.Durable",
                            "type": "Phone",
                            "durability": "Durable"
                        },
                        "valid_for": null,
                        "contact_creation_date": 1467931730
                    }
                ]
            },
            {
                "id": {
                    "key": "Person.23353653-f77f-48da-b789-914fc80f0d18.Durable",
                    "type": "Person",
                    "durability": "Durable"
                },
                "names": [
                    {
                        "salutation": null,
                        "first_name": "Nina",
                        "middle_name": null,
                        "last_name": "Oliveira",
                        "suffix": null
                    }
                ],
                "age_range": null,
                "gender": null,
                "locations": [
                    {
                        "id": {
                            "key": "Location.e0da6516-1397-4da7-bc08-b1d227cedbbb.Durable",
                            "type": "Location",
                            "durability": "Durable"
                        },
                        "type": "Address",
                        "valid_for": null,
                        "legal_entities_at": [
                            {
                                "id": {
                                    "key": "Person.23353653-f77f-48da-b789-914fc80f0d18.Durable",
                                    "type": "Person",
                                    "durability": "Durable"
                                },
                                "names": [
                                    {
                                        "salutation": null,
                                        "first_name": "Nina",
                                        "middle_name": null,
                                        "last_name": "Oliveira",
                                        "suffix": null
                                    }
                                ],
                                "age_range": null,
                                "gender": null,
                                "locations": null,
                                "phones": null
                            },
                            {
                                "id": {
                                    "key": "Person.dc99f13c-dcf8-4bfe-8d8e-30c3d36157e1.Durable",
                                    "type": "Person",
                                    "durability": "Durable"
                                },
                                "names": [
                                    {
                                        "salutation": null,
                                        "first_name": "David",
                                        "middle_name": null,
                                        "last_name": "Vaillencourt",
                                        "suffix": null
                                    }
                                ],
                                "age_range": null,
                                "gender": "Male",
                                "locations": null,
                                "phones": null
                            },
                            {
                                "id": {
                                    "key": "Person.a40fdc3f-d0e4-473b-a88c-23f565ff279b.Durable",
                                    "type": "Person",
                                    "durability": "Durable"
                                },
                                "names": [
                                    {
                                        "salutation": null,
                                        "first_name": "Alicia",
                                        "middle_name": null,
                                        "last_name": "Adams",
                                        "suffix": null
                                    }
                                ],
                                "age_range": {
                                    "start": 30,
                                    "end": 34
                                },
                                "gender": "Female",
                                "locations": null,
                                "phones": null
                            }
                        ],
                        "city": "New Orleans",
                        "postal_code": "70130",
                        "zip4": "4730",
                        "state_code": "LA",
                        "country_code": "US",
                        "is_receiving_mail": true,
                        "not_receiving_mail_reason": null,
                        "usage": "Residential",
                        "delivery_point": "SingleUnit",
                        "address_type": "Street",
                        "lat_long": {
                            "latitude": 29.934284,
                            "longitude": -90.071841,
                            "accuracy": "RoofTop"
                        },
                        "is_deliverable": true,
                        "standard_address_line1": "1017 Race St",
                        "standard_address_line2": "",
                        "is_historical": false
                    }
                ],
                "phones": [
                    {
                        "id": {
                            "key": "Phone.af536fef-a2e2-4b08-cfe3-bc7128b4491b.Durable",
                            "type": "Phone",
                            "durability": "Durable"
                        },
                        "line_type": null,
                        "belongs_to": null,
                        "associated_locations": null,
                        "is_valid": true,
                        "phone_number": "9203210153",
                        "country_calling_code": "1",
                        "carrier": null,
                        "is_prepaid": null,
                        "is_connected": null,
                        "valid_for": null,
                        "contact_creation_date": 1467931676
                    }
                ]
            }
        ],
        "messages": []
    }'
  end

  def self.fake_white_page_search_results_with_bogus_results
    '{
      "results": [
        {
          "id": {
            "key": "Person.0990221d-9bd6-46a4-beeb-af178a6fc037.Durable",
            "type": "Person",
            "durability": "Durable"
          },
          "names": [
            {
              "salutation": null,
              "first_name": "Deborah",
              "middle_name": null,
              "last_name": "Santos",
              "suffix": null
            }
          ],
          "age_range": null,
          "gender": null,
          "locations": [
            {
              "id": {
                "key": "Location.715b1597-6cfb-4c6f-aab0-ffda693183b3.Durable",
                "type": "Location",
                "durability": "Durable"
              },
              "type": "Address",
              "valid_for": null,
              "legal_entities_at": [
                {
                  "id": {
                    "key": "Person.0990221d-9bd6-46a4-beeb-af178a6fc037.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Deborah",
                      "middle_name": null,
                      "last_name": "Santos",
                      "suffix": null
                    }
                  ],
                  "age_range": null,
                  "gender": null,
                  "locations": null,
                  "phones": null
                },
                {
                  "id": {
                    "key": "Person.b48b711e-2eb1-4a60-ae65-6be06f02d7e2.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Bill",
                      "middle_name": "M",
                      "last_name": "Mohr",
                      "suffix": null
                    }
                  ],
                  "age_range": {
                    "start": 45,
                    "end": 49
                  },
                  "gender": "Male",
                  "locations": null,
                  "phones": null
                }
              ],
              "city": "Some wack place",
              "postal_code": "70130",
              "zip4": "3614",
              "state_code": "LA",
              "country_code": "US",
              "is_receiving_mail": true,
              "not_receiving_mail_reason": null,
              "usage": "Residential",
              "delivery_point": "SingleUnit",
              "address_type": "Street",
              "lat_long": {
                "latitude": 30.29982,
                "longitude": -89.73972,
                "accuracy": "RoofTop"
              },
              "is_deliverable": true,
              "standard_address_line1": "208 Lake Village Blvd",
              "standard_address_line2": "",
              "is_historical": false
            }
          ],
          "phones": []
        },
        {
          "id": {
            "key": "Person.b001aaf9-3381-4e63-9fbb-382b701cde71.Durable",
            "type": "Person",
            "durability": "Durable"
          },
          "names": [
            {
              "salutation": null,
              "first_name": "Elizet",
              "middle_name": null,
              "last_name": "Santos",
              "suffix": null
            }
          ],
          "age_range": null,
          "gender": null,
          "locations": [
            {
              "id": {
                "key": "Location.9d178e73-125c-4a37-bb8d-b619bf5d8ac7.Durable",
                "type": "Location",
                "durability": "Durable"
              },
              "type": "Address",
              "valid_for": null,
              "legal_entities_at": [
                {
                  "id": {
                    "key": "Person.b001aaf9-3381-4e63-9fbb-382b701cde71.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Elizet",
                      "middle_name": null,
                      "last_name": "Santos",
                      "suffix": null
                    }
                  ],
                  "age_range": null,
                  "gender": null,
                  "locations": null,
                  "phones": null
                },
                {
                  "id": {
                    "key": "Person.3f6bf965-3ce1-4aef-a36f-c8e39a4fc6b3.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Al",
                      "middle_name": "I",
                      "last_name": "Flores",
                      "suffix": null
                    }
                  ],
                  "age_range": null,
                  "gender": null,
                  "locations": null,
                  "phones": null
                }
              ],
              "city": "Slidell",
              "postal_code": "70461",
              "zip4": "3645",
              "state_code": "LA",
              "country_code": "US",
              "is_receiving_mail": true,
              "not_receiving_mail_reason": null,
              "usage": "Residential",
              "delivery_point": "SingleUnit",
              "address_type": "Street",
              "lat_long": {
                "latitude": 30.2357,
                "longitude": -89.7179,
                "accuracy": "PostalCode"
              },
              "is_deliverable": true,
              "standard_address_line1": "90 Lake Village Blvd",
              "standard_address_line2": "",
              "is_historical": false
            },
            {
              "id": {
                "key": "Location.09ee4cc9-a4bd-4a9b-95d2-226ee148a071.Durable",
                "type": "Location",
                "durability": "Durable"
              },
              "type": "Address",
              "valid_for": null,
              "legal_entities_at": [
                {
                  "id": {
                    "key": "Person.b001aaf9-3381-4e63-9fbb-382b701cde71.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Elizet",
                      "middle_name": null,
                      "last_name": "Santos",
                      "suffix": null
                    }
                  ],
                  "age_range": null,
                  "gender": null,
                  "locations": null,
                  "phones": null
                },
                {
                  "id": {
                    "key": "Person.e17a6508-174d-4851-9572-5f1e8029145d.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Myrtle",
                      "middle_name": "A",
                      "last_name": "Oliver",
                      "suffix": null
                    }
                  ],
                  "age_range": {
                    "start": 65,
                    "end": 200
                  },
                  "gender": "Female",
                  "locations": null,
                  "phones": null
                }
              ],
              "city": "Lithia Springs",
              "postal_code": "30122",
              "zip4": "2017",
              "state_code": "GA",
              "country_code": "US",
              "is_receiving_mail": true,
              "not_receiving_mail_reason": null,
              "usage": "Residential",
              "delivery_point": "SingleUnit",
              "address_type": "Street",
              "lat_long": {
                "latitude": 33.784721,
                "longitude": -84.67382,
                "accuracy": "RoofTop"
              },
              "is_deliverable": true,
              "standard_address_line1": "3980 N Martin Way",
              "standard_address_line2": "",
              "is_historical": false
            }
          ],
          "phones": []
        },
        {
          "id": {
            "key": "Person.40d038bf-d052-434d-ae82-7d2d632e4ad5.Durable",
            "type": "Person",
            "durability": "Durable"
          },
          "names": [
            {
              "salutation": null,
              "first_name": "Alvin",
              "middle_name": "E",
              "last_name": "Santos",
              "suffix": null
            }
          ],
          "age_range": {
            "start": 40,
            "end": 44
          },
          "gender": "Male",
          "locations": [
            {
              "id": {
                "key": "Location.4f579035-d026-4e0c-9f9b-d86dceff6307.Durable",
                "type": "Location",
                "durability": "Durable"
              },
              "type": "Address",
              "valid_for": {
                "start": {
                  "year": 2002,
                  "month": 9,
                  "day": 24
                },
                "stop": null
              },
              "legal_entities_at": [
                {
                  "id": {
                    "key": "Person.40d038bf-d052-434d-ae82-7d2d632e4ad5.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Alvin",
                      "middle_name": "E",
                      "last_name": "Santos",
                      "suffix": null
                    }
                  ],
                  "age_range": {
                    "start": 40,
                    "end": 44
                  },
                  "gender": "Male",
                  "locations": null,
                  "phones": null
                },
                {
                  "id": {
                    "key": "Person.0ad0da52-c258-49a2-8aed-69901562bcd2.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Claribel",
                      "middle_name": "A",
                      "last_name": "Diaz",
                      "suffix": null
                    }
                  ],
                  "age_range": {
                    "start": 40,
                    "end": 44
                  },
                  "gender": "Female",
                  "locations": null,
                  "phones": null
                },
                {
                  "id": {
                    "key": "Person.4c2220d8-12dd-4d79-9b09-4fa15be19d2b.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Claribel",
                      "middle_name": null,
                      "last_name": "Santos",
                      "suffix": null
                    }
                  ],
                  "age_range": {
                    "start": 45,
                    "end": 49
                  },
                  "gender": "Female",
                  "locations": null,
                  "phones": null
                }
              ],
              "city": "Slidell",
              "postal_code": "70461",
              "zip4": "5345",
              "state_code": "LA",
              "country_code": "US",
              "is_receiving_mail": true,
              "not_receiving_mail_reason": null,
              "usage": "Residential",
              "delivery_point": "SingleUnit",
              "address_type": "Street",
              "lat_long": {
                "latitude": 30.283626,
                "longitude": -89.730103,
                "accuracy": "RoofTop"
              },
              "is_deliverable": true,
              "standard_address_line1": "1003 Janette Ct",
              "standard_address_line2": "",
              "is_historical": false
            },
            {
              "id": {
                "key": "Location.c9117739-59a3-444a-a45d-1eeb48fcb8e9.Durable",
                "type": "Location",
                "durability": "Durable"
              },
              "type": "Address",
              "valid_for": {
                "start": {
                  "year": 2001,
                  "month": 3,
                  "day": 1
                },
                "stop": {
                  "year": 2003,
                  "month": 3,
                  "day": 1
                }
              },
              "legal_entities_at": [
                {
                  "id": {
                    "key": "Person.40d038bf-d052-434d-ae82-7d2d632e4ad5.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Alvin",
                      "middle_name": "E",
                      "last_name": "Santos",
                      "suffix": null
                    }
                  ],
                  "age_range": {
                    "start": 40,
                    "end": 44
                  },
                  "gender": "Male",
                  "locations": null,
                  "phones": null
                }
              ],
              "city": "Slidell",
              "postal_code": "70460",
              "zip4": "8453",
              "state_code": "LA",
              "country_code": "US",
              "is_receiving_mail": true,
              "not_receiving_mail_reason": null,
              "usage": "Residential",
              "delivery_point": "SingleUnit",
              "address_type": "Street",
              "lat_long": {
                "latitude": 30.293928,
                "longitude": -89.811234,
                "accuracy": "RoofTop"
              },
              "is_deliverable": true,
              "standard_address_line1": "105 Elizabeth Dr",
              "standard_address_line2": "",
              "is_historical": true
            },
            {
              "id": {
                "key": "Location.8fe608b8-d5a4-4992-abf6-570fc9c97c3f.Durable",
                "type": "Location",
                "durability": "Durable"
              },
              "type": "Address",
              "valid_for": {
                "start": {
                  "year": 2000,
                  "month": 12,
                  "day": 1
                },
                "stop": {
                  "year": 2000,
                  "month": 12,
                  "day": 1
                }
              },
              "legal_entities_at": [
                {
                  "id": {
                    "key": "Person.40d038bf-d052-434d-ae82-7d2d632e4ad5.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Alvin",
                      "middle_name": "E",
                      "last_name": "Santos",
                      "suffix": null
                    }
                  ],
                  "age_range": {
                    "start": 40,
                    "end": 44
                  },
                  "gender": "Male",
                  "locations": null,
                  "phones": null
                }
              ],
              "city": "Slidell",
              "postal_code": "70458",
              "zip4": "9258",
              "state_code": "LA",
              "country_code": "US",
              "is_receiving_mail": true,
              "not_receiving_mail_reason": null,
              "usage": "Residential",
              "delivery_point": "MultiUnit",
              "address_type": "Highrise",
              "lat_long": {
                "latitude": 30.21549,
                "longitude": -89.791229,
                "accuracy": "RoofTop"
              },
              "is_deliverable": true,
              "standard_address_line1": "1580 Harbor Dr Unit 322",
              "standard_address_line2": "",
              "is_historical": true
            },
            {
              "id": {
                "key": "Location.39a51904-eea2-48f0-b5df-df62ccbcf4d3.Durable",
                "type": "Location",
                "durability": "Durable"
              },
              "type": "Address",
              "valid_for": {
                "start": {
                  "year": 2001,
                  "month": 1,
                  "day": 1
                },
                "stop": {
                  "year": 2002,
                  "month": 4,
                  "day": 1
                }
              },
              "legal_entities_at": [
                {
                  "id": {
                    "key": "Person.40d038bf-d052-434d-ae82-7d2d632e4ad5.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Alvin",
                      "middle_name": "E",
                      "last_name": "Santos",
                      "suffix": null
                    }
                  ],
                  "age_range": {
                    "start": 40,
                    "end": 44
                  },
                  "gender": "Male",
                  "locations": null,
                  "phones": null
                }
              ],
              "city": "Daly City",
              "postal_code": "94015",
              "zip4": "3932",
              "state_code": "CA",
              "country_code": "US",
              "is_receiving_mail": true,
              "not_receiving_mail_reason": null,
              "usage": "Residential",
              "delivery_point": "SingleUnit",
              "address_type": "Street",
              "lat_long": {
                "latitude": 37.675476,
                "longitude": -122.483109,
                "accuracy": "RoofTop"
              },
              "is_deliverable": true,
              "standard_address_line1": "327 Lakeshire Dr",
              "standard_address_line2": "",
              "is_historical": true
            },
            {
              "id": {
                "key": "Location.b55c9278-e0b7-49da-bf1a-63fc68b1880c.Durable",
                "type": "Location",
                "durability": "Durable"
              },
              "type": "Address",
              "valid_for": {
                "start": {
                  "year": 1999,
                  "month": 4,
                  "day": 1
                },
                "stop": {
                  "year": 2003,
                  "month": 9,
                  "day": 1
                }
              },
              "legal_entities_at": [
                {
                  "id": {
                    "key": "Person.40d038bf-d052-434d-ae82-7d2d632e4ad5.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Alvin",
                      "middle_name": "E",
                      "last_name": "Santos",
                      "suffix": null
                    }
                  ],
                  "age_range": {
                    "start": 40,
                    "end": 44
                  },
                  "gender": "Male",
                  "locations": null,
                  "phones": null
                }
              ],
              "city": "Dallas",
              "postal_code": "75287",
              "zip4": "4220",
              "state_code": "TX",
              "country_code": "US",
              "is_receiving_mail": true,
              "not_receiving_mail_reason": null,
              "usage": "Residential",
              "delivery_point": "MultiUnit",
              "address_type": "Highrise",
              "lat_long": {
                "latitude": 33.004452,
                "longitude": -96.82481,
                "accuracy": "RoofTop"
              },
              "is_deliverable": true,
              "standard_address_line1": "4750 Pear Ridge Dr Apt 7201",
              "standard_address_line2": "",
              "is_historical": true
            },
            {
              "id": {
                "key": "Location.742d73b0-a710-4e1b-90b6-98aa47e587db.Durable",
                "type": "Location",
                "durability": "Durable"
              },
              "type": "Address",
              "valid_for": {
                "start": {
                  "year": 1998,
                  "month": 3,
                  "day": 1
                },
                "stop": {
                  "year": 1999,
                  "month": 1,
                  "day": 1
                }
              },
              "legal_entities_at": [
                {
                  "id": {
                    "key": "Person.40d038bf-d052-434d-ae82-7d2d632e4ad5.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Alvin",
                      "middle_name": "E",
                      "last_name": "Santos",
                      "suffix": null
                    }
                  ],
                  "age_range": {
                    "start": 40,
                    "end": 44
                  },
                  "gender": "Male",
                  "locations": null,
                  "phones": null
                }
              ],
              "city": "Dallas",
              "postal_code": "75252",
              "zip4": "2603",
              "state_code": "TX",
              "country_code": "US",
              "is_receiving_mail": true,
              "not_receiving_mail_reason": null,
              "usage": "Residential",
              "delivery_point": "MultiUnit",
              "address_type": "Highrise",
              "lat_long": {
                "latitude": 33.006607,
                "longitude": -96.798752,
                "accuracy": "RoofTop"
              },
              "is_deliverable": true,
              "standard_address_line1": "18790 Lloyd Dr Apt 125",
              "standard_address_line2": "",
              "is_historical": true
            },
            {
              "id": {
                "key": "Location.d02f7d3e-b46b-43ec-8fa9-a19b87bc7f17.Durable",
                "type": "Location",
                "durability": "Durable"
              },
              "type": "Address",
              "valid_for": {
                "start": {
                  "year": 2000,
                  "month": 5,
                  "day": 1
                },
                "stop": {
                  "year": 2001,
                  "month": 4,
                  "day": 1
                }
              },
              "legal_entities_at": [
                {
                  "id": {
                    "key": "Person.40d038bf-d052-434d-ae82-7d2d632e4ad5.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Alvin",
                      "middle_name": "E",
                      "last_name": "Santos",
                      "suffix": null
                    }
                  ],
                  "age_range": {
                    "start": 40,
                    "end": 44
                  },
                  "gender": "Male",
                  "locations": null,
                  "phones": null
                }
              ],
              "city": "Dallas",
              "postal_code": "75287",
              "zip4": "7124",
              "state_code": "TX",
              "country_code": "US",
              "is_receiving_mail": true,
              "not_receiving_mail_reason": null,
              "usage": "Residential",
              "delivery_point": "MultiUnit",
              "address_type": "Highrise",
              "lat_long": {
                "latitude": 32.999947,
                "longitude": -96.825632,
                "accuracy": "RoofTop"
              },
              "is_deliverable": true,
              "standard_address_line1": "4753 Old Bent Tree Ln Apt 902",
              "standard_address_line2": "",
              "is_historical": true
            }
          ],
          "phones": []
        },
        {
          "id": {
            "key": "Person.b7016581-9894-4a6c-86ad-43f8a7cf3bad.Durable",
            "type": "Person",
            "durability": "Durable"
          },
          "names": [
            {
              "salutation": null,
              "first_name": "Luciano",
              "middle_name": null,
              "last_name": "Santos",
              "suffix": null
            }
          ],
          "age_range": null,
          "gender": "Male",
          "locations": [
            {
              "id": {
                "key": "Location.dab3f93b-978b-46d1-bc61-d2a87fde2f62.Durable",
                "type": "Location",
                "durability": "Durable"
              },
              "type": "Address",
              "valid_for": {
                "start": {
                  "year": 2015,
                  "month": 6,
                  "day": 11
                },
                "stop": null
              },
              "legal_entities_at": [
                {
                  "id": {
                    "key": "Person.b7016581-9894-4a6c-86ad-43f8a7cf3bad.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Luciano",
                      "middle_name": null,
                      "last_name": "Santos",
                      "suffix": null
                    }
                  ],
                  "age_range": null,
                  "gender": "Male",
                  "locations": null,
                  "phones": null
                },
                {
                  "id": {
                    "key": "Person.725c095b-b1d1-4fa4-b42c-baef01a8eeb2.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "James",
                      "middle_name": "M",
                      "last_name": "Stephens",
                      "suffix": null
                    }
                  ],
                  "age_range": {
                    "start": 35,
                    "end": 39
                  },
                  "gender": "Male",
                  "locations": null,
                  "phones": null
                }
              ],
              "city": "Slidell",
              "postal_code": "70461",
              "zip4": "4118",
              "state_code": "LA",
              "country_code": "US",
              "is_receiving_mail": true,
              "not_receiving_mail_reason": null,
              "usage": "Residential",
              "delivery_point": "SingleUnit",
              "address_type": "Street",
              "lat_long": {
                "latitude": 30.286543,
                "longitude": -89.718361,
                "accuracy": "RoofTop"
              },
              "is_deliverable": true,
              "standard_address_line1": "245 S Military Rd",
              "standard_address_line2": "",
              "is_historical": false
            }
          ],
          "phones": []
        },
        {
          "id": {
            "key": "Person.a47d7a95-9713-4988-9759-3e73ab35944e.Durable",
            "type": "Person",
            "durability": "Durable"
          },
          "names": [
            {
              "salutation": null,
              "first_name": "Leiley",
              "middle_name": null,
              "last_name": "Santos",
              "suffix": null
            }
          ],
          "age_range": {
            "start": 30,
            "end": 34
          },
          "gender": "Female",
          "locations": [
            {
              "id": {
                "key": "Location.ad12e904-748b-4a30-b8a2-6319d70846bc.Durable",
                "type": "Location",
                "durability": "Durable"
              },
              "type": "Address",
              "valid_for": {
                "start": {
                  "year": 2014,
                  "month": 1,
                  "day": 11
                },
                "stop": null
              },
              "legal_entities_at": [
                {
                  "id": {
                    "key": "Person.a47d7a95-9713-4988-9759-3e73ab35944e.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Leiley",
                      "middle_name": null,
                      "last_name": "Santos",
                      "suffix": null
                    }
                  ],
                  "age_range": {
                    "start": 30,
                    "end": 34
                  },
                  "gender": "Female",
                  "locations": null,
                  "phones": null
                },
                {
                  "id": {
                    "key": "Person.dfca5a6d-347a-4a16-ab7c-546f48f8534f.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Joseph",
                      "middle_name": "V",
                      "last_name": "Liberato",
                      "suffix": "Jr."
                    }
                  ],
                  "age_range": {
                    "start": 30,
                    "end": 34
                  },
                  "gender": "Male",
                  "locations": null,
                  "phones": null
                },
                {
                  "id": {
                    "key": "Person.2d23dc94-aeea-40d1-b324-489df3533b0c.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Vince",
                      "middle_name": null,
                      "last_name": "Liberato",
                      "suffix": null
                    }
                  ],
                  "age_range": null,
                  "gender": "Male",
                  "locations": null,
                  "phones": null
                },
                {
                  "id": {
                    "key": "Person.2b8d5211-338a-4c7e-aee5-05eb9e8395e6.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Brian",
                      "middle_name": null,
                      "last_name": "Piekarski",
                      "suffix": null
                    }
                  ],
                  "age_range": null,
                  "gender": null,
                  "locations": null,
                  "phones": null
                }
              ],
              "city": "Slidell",
              "postal_code": "70461",
              "zip4": "4911",
              "state_code": "LA",
              "country_code": "US",
              "is_receiving_mail": true,
              "not_receiving_mail_reason": null,
              "usage": "Residential",
              "delivery_point": "SingleUnit",
              "address_type": "Street",
              "lat_long": {
                "latitude": 30.29819,
                "longitude": -89.715751,
                "accuracy": "RoofTop"
              },
              "is_deliverable": true,
              "standard_address_line1": "519 Bradford Dr",
              "standard_address_line2": "",
              "is_historical": false
            },
            {
              "id": {
                "key": "Location.d7a8aaa8-4bac-4b18-919b-e327c1ffaa03.Durable",
                "type": "Location",
                "durability": "Durable"
              },
              "type": "Address",
              "valid_for": {
                "start": {
                  "year": 2009,
                  "month": 5,
                  "day": 1
                },
                "stop": {
                  "year": 2013,
                  "month": 2,
                  "day": 6
                }
              },
              "legal_entities_at": [
                {
                  "id": {
                    "key": "Person.a47d7a95-9713-4988-9759-3e73ab35944e.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Leiley",
                      "middle_name": null,
                      "last_name": "Santos",
                      "suffix": null
                    }
                  ],
                  "age_range": {
                    "start": 30,
                    "end": 34
                  },
                  "gender": "Female",
                  "locations": null,
                  "phones": null
                }
              ],
              "city": "New Braunfels",
              "postal_code": "78130",
              "zip4": "7009",
              "state_code": "TX",
              "country_code": "US",
              "is_receiving_mail": true,
              "not_receiving_mail_reason": null,
              "usage": "Residential",
              "delivery_point": "SingleUnit",
              "address_type": "Street",
              "lat_long": {
                "latitude": 29.678496,
                "longitude": -98.145377,
                "accuracy": "RoofTop"
              },
              "is_deliverable": true,
              "standard_address_line1": "216 Loma Vista St",
              "standard_address_line2": "",
              "is_historical": true
            },
            {
              "id": {
                "key": "Location.94a63512-8e4f-4a25-8b98-f66dd4fca44c.Durable",
                "type": "Location",
                "durability": "Durable"
              },
              "type": "Address",
              "valid_for": {
                "start": {
                  "year": 2002,
                  "month": 6,
                  "day": 1
                },
                "stop": null
              },
              "legal_entities_at": [
                {
                  "id": {
                    "key": "Person.a47d7a95-9713-4988-9759-3e73ab35944e.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Leiley",
                      "middle_name": null,
                      "last_name": "Santos",
                      "suffix": null
                    }
                  ],
                  "age_range": {
                    "start": 30,
                    "end": 34
                  },
                  "gender": "Female",
                  "locations": null,
                  "phones": null
                },
                {
                  "id": {
                    "key": "Person.e476200b-1221-43ad-99c4-96ea917dd2e8.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Olga",
                      "middle_name": "M",
                      "last_name": "Santos",
                      "suffix": null
                    }
                  ],
                  "age_range": {
                    "start": 65,
                    "end": 200
                  },
                  "gender": "Female",
                  "locations": null,
                  "phones": null
                },
                {
                  "id": {
                    "key": "Person.54596fdd-a1f1-40c6-aa8e-20570507a5f4.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Jose",
                      "middle_name": "M",
                      "last_name": "Santos",
                      "suffix": null
                    }
                  ],
                  "age_range": {
                    "start": 55,
                    "end": 59
                  },
                  "gender": "Male",
                  "locations": null,
                  "phones": null
                }
              ],
              "city": "Dallas",
              "postal_code": "75220",
              "zip4": "3641",
              "state_code": "TX",
              "country_code": "US",
              "is_receiving_mail": true,
              "not_receiving_mail_reason": null,
              "usage": "Residential",
              "delivery_point": "SingleUnit",
              "address_type": "Street",
              "lat_long": {
                "latitude": 32.869576,
                "longitude": -96.856651,
                "accuracy": "RoofTop"
              },
              "is_deliverable": true,
              "standard_address_line1": "3651 Fontana Dr",
              "standard_address_line2": "",
              "is_historical": false
            },
            {
              "id": {
                "key": "Location.c5cd50a4-6a57-40e6-8e9f-24cec62a2459.Durable",
                "type": "Location",
                "durability": "Durable"
              },
              "type": "Address",
              "valid_for": {
                "start": null,
                "stop": {
                  "year": 2012,
                  "month": 3,
                  "day": 1
                }
              },
              "legal_entities_at": [
                {
                  "id": {
                    "key": "Person.a47d7a95-9713-4988-9759-3e73ab35944e.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Leiley",
                      "middle_name": null,
                      "last_name": "Santos",
                      "suffix": null
                    }
                  ],
                  "age_range": {
                    "start": 30,
                    "end": 34
                  },
                  "gender": "Female",
                  "locations": null,
                  "phones": null
                }
              ],
              "city": "New Braunfels",
              "postal_code": "78130",
              "zip4": "2682",
              "state_code": "TX",
              "country_code": "US",
              "is_receiving_mail": true,
              "not_receiving_mail_reason": null,
              "usage": "Residential",
              "delivery_point": "SingleUnit",
              "address_type": "Street",
              "lat_long": {
                "latitude": 29.749283,
                "longitude": -98.063477,
                "accuracy": "RoofTop"
              },
              "is_deliverable": true,
              "standard_address_line1": "159 Woodpecker Run",
              "standard_address_line2": "",
              "is_historical": true
            },
            {
              "id": {
                "key": "Location.afc0bfb8-2818-4c1d-a41b-32add05ab0ab.Durable",
                "type": "Location",
                "durability": "Durable"
              },
              "type": "Address",
              "valid_for": {
                "start": {
                  "year": 2006,
                  "month": 12,
                  "day": 4
                },
                "stop": null
              },
              "legal_entities_at": [
                {
                  "id": {
                    "key": "Person.a47d7a95-9713-4988-9759-3e73ab35944e.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Leiley",
                      "middle_name": null,
                      "last_name": "Santos",
                      "suffix": null
                    }
                  ],
                  "age_range": {
                    "start": 30,
                    "end": 34
                  },
                  "gender": "Female",
                  "locations": null,
                  "phones": null
                },
                {
                  "id": {
                    "key": "Person.779d63fe-dfc9-4952-a600-79f9941ff5aa.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Jose",
                      "middle_name": "M",
                      "last_name": "Santos",
                      "suffix": null
                    }
                  ],
                  "age_range": {
                    "start": 55,
                    "end": 59
                  },
                  "gender": "Male",
                  "locations": null,
                  "phones": null
                },
                {
                  "id": {
                    "key": "Person.4ab36f22-7668-477b-8ba0-5085586d5558.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": "Ms.",
                      "first_name": "Lilian",
                      "middle_name": null,
                      "last_name": "Santos",
                      "suffix": null
                    }
                  ],
                  "age_range": {
                    "start": 60,
                    "end": 64
                  },
                  "gender": "Female",
                  "locations": null,
                  "phones": null
                }
              ],
              "city": "Dallas",
              "postal_code": "75234",
              "zip4": "3631",
              "state_code": "TX",
              "country_code": "US",
              "is_receiving_mail": true,
              "not_receiving_mail_reason": null,
              "usage": "Residential",
              "delivery_point": "SingleUnit",
              "address_type": "Street",
              "lat_long": {
                "latitude": 32.934895,
                "longitude": -96.879555,
                "accuracy": "RoofTop"
              },
              "is_deliverable": true,
              "standard_address_line1": "13827 Janwood Ln",
              "standard_address_line2": "",
              "is_historical": false
            },
            {
              "id": {
                "key": "Location.be29d251-835e-4502-a07b-f4eb266aecac.Durable",
                "type": "Location",
                "durability": "Durable"
              },
              "type": "Address",
              "valid_for": {
                "start": {
                  "year": 2009,
                  "month": 5,
                  "day": 1
                },
                "stop": {
                  "year": 2013,
                  "month": 4,
                  "day": 22
                }
              },
              "legal_entities_at": [
                {
                  "id": {
                    "key": "Person.a47d7a95-9713-4988-9759-3e73ab35944e.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Leiley",
                      "middle_name": null,
                      "last_name": "Santos",
                      "suffix": null
                    }
                  ],
                  "age_range": {
                    "start": 30,
                    "end": 34
                  },
                  "gender": "Female",
                  "locations": null,
                  "phones": null
                }
              ],
              "city": "Memphis",
              "postal_code": "38135",
              "zip4": "1423",
              "state_code": "TN",
              "country_code": "US",
              "is_receiving_mail": true,
              "not_receiving_mail_reason": null,
              "usage": "Residential",
              "delivery_point": "SingleUnit",
              "address_type": "Street",
              "lat_long": {
                "latitude": 35.236542,
                "longitude": -89.86718,
                "accuracy": "RoofTop"
              },
              "is_deliverable": true,
              "standard_address_line1": "4042 Bedford Cv",
              "standard_address_line2": "",
              "is_historical": true
            },
            {
              "id": {
                "key": "Location.3c3b810e-d101-4d98-b4d0-c748429a2b2e.Durable",
                "type": "Location",
                "durability": "Durable"
              },
              "type": "Address",
              "valid_for": {
                "start": {
                  "year": 2003,
                  "month": 8,
                  "day": 1
                },
                "stop": {
                  "year": 2003,
                  "month": 12,
                  "day": 1
                }
              },
              "legal_entities_at": [
                {
                  "id": {
                    "key": "Person.a47d7a95-9713-4988-9759-3e73ab35944e.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Leiley",
                      "middle_name": null,
                      "last_name": "Santos",
                      "suffix": null
                    }
                  ],
                  "age_range": {
                    "start": 30,
                    "end": 34
                  },
                  "gender": "Female",
                  "locations": null,
                  "phones": null
                }
              ],
              "city": "Denton",
              "postal_code": "76209",
              "zip4": "7541",
              "state_code": "TX",
              "country_code": "US",
              "is_receiving_mail": false,
              "not_receiving_mail_reason": null,
              "usage": null,
              "delivery_point": null,
              "address_type": null,
              "lat_long": {
                "latitude": 33.217099,
                "longitude": -97.111441,
                "accuracy": "RoofTop"
              },
              "is_deliverable": null,
              "standard_address_line1": "408 Audra Ln",
              "standard_address_line2": "",
              "is_historical": true
            },
            {
              "id": {
                "key": "Location.56fcddc5-e619-44bb-a3d8-1fd6b6bd01d5.Durable",
                "type": "Location",
                "durability": "Durable"
              },
              "type": "Address",
              "valid_for": null,
              "legal_entities_at": [
                {
                  "id": {
                    "key": "Person.a47d7a95-9713-4988-9759-3e73ab35944e.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Leiley",
                      "middle_name": null,
                      "last_name": "Santos",
                      "suffix": null
                    }
                  ],
                  "age_range": {
                    "start": 30,
                    "end": 34
                  },
                  "gender": "Female",
                  "locations": null,
                  "phones": null
                }
              ],
              "city": "Huntington Park",
              "postal_code": "90255",
              "zip4": "4070",
              "state_code": "CA",
              "country_code": "US",
              "is_receiving_mail": true,
              "not_receiving_mail_reason": null,
              "usage": "Business",
              "delivery_point": "SingleUnit",
              "address_type": "Street",
              "lat_long": {
                "latitude": 33.979281,
                "longitude": -118.22616,
                "accuracy": "RoofTop"
              },
              "is_deliverable": true,
              "standard_address_line1": "2563 Zoe Ave",
              "standard_address_line2": "",
              "is_historical": true
            },
            {
              "id": {
                "key": "Location.f37b943b-1091-4310-a262-22719a94aab5.Durable",
                "type": "Location",
                "durability": "Durable"
              },
              "type": "Address",
              "valid_for": {
                "start": {
                  "year": 2006,
                  "month": 1,
                  "day": 1
                },
                "stop": {
                  "year": 2006,
                  "month": 2,
                  "day": 1
                }
              },
              "legal_entities_at": [
                {
                  "id": {
                    "key": "Person.a47d7a95-9713-4988-9759-3e73ab35944e.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Leiley",
                      "middle_name": null,
                      "last_name": "Santos",
                      "suffix": null
                    }
                  ],
                  "age_range": {
                    "start": 30,
                    "end": 34
                  },
                  "gender": "Female",
                  "locations": null,
                  "phones": null
                }
              ],
              "city": "Denton",
              "postal_code": "76201",
              "zip4": "2714",
              "state_code": "TX",
              "country_code": "US",
              "is_receiving_mail": true,
              "not_receiving_mail_reason": null,
              "usage": "Residential",
              "delivery_point": "SingleUnit",
              "address_type": "Street",
              "lat_long": {
                "latitude": 33.22282,
                "longitude": -97.148643,
                "accuracy": "RoofTop"
              },
              "is_deliverable": true,
              "standard_address_line1": "1424 Broadway St",
              "standard_address_line2": "",
              "is_historical": true
            },
            {
              "id": {
                "key": "Location.65f3fb78-3436-4680-9cc3-ef41286dd032.Durable",
                "type": "Location",
                "durability": "Durable"
              },
              "type": "Address",
              "valid_for": {
                "start": {
                  "year": 2004,
                  "month": 7,
                  "day": 26
                },
                "stop": {
                  "year": 2012,
                  "month": 10,
                  "day": 23
                }
              },
              "legal_entities_at": [
                {
                  "id": {
                    "key": "Person.a47d7a95-9713-4988-9759-3e73ab35944e.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Leiley",
                      "middle_name": null,
                      "last_name": "Santos",
                      "suffix": null
                    }
                  ],
                  "age_range": {
                    "start": 30,
                    "end": 34
                  },
                  "gender": "Female",
                  "locations": null,
                  "phones": null
                }
              ],
              "city": "Dallas",
              "postal_code": "75225",
              "zip4": "6901",
              "state_code": "TX",
              "country_code": "US",
              "is_receiving_mail": true,
              "not_receiving_mail_reason": null,
              "usage": "Residential",
              "delivery_point": "SingleUnit",
              "address_type": "Street",
              "lat_long": {
                "latitude": 32.852371,
                "longitude": -96.806305,
                "accuracy": "RoofTop"
              },
              "is_deliverable": true,
              "standard_address_line1": "4136 Amherst Ave",
              "standard_address_line2": "",
              "is_historical": true
            },
            {
              "id": {
                "key": "Location.8f6b4754-3322-4591-898b-a32fa9d5eeec.Durable",
                "type": "Location",
                "durability": "Durable"
              },
              "type": "Address",
              "valid_for": {
                "start": {
                  "year": 2004,
                  "month": 11,
                  "day": 1
                },
                "stop": {
                  "year": 2005,
                  "month": 3,
                  "day": 1
                }
              },
              "legal_entities_at": [
                {
                  "id": {
                    "key": "Person.a47d7a95-9713-4988-9759-3e73ab35944e.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Leiley",
                      "middle_name": null,
                      "last_name": "Santos",
                      "suffix": null
                    }
                  ],
                  "age_range": {
                    "start": 30,
                    "end": 34
                  },
                  "gender": "Female",
                  "locations": null,
                  "phones": null
                }
              ],
              "city": "Denton",
              "postal_code": "76209",
              "zip4": "6496",
              "state_code": "TX",
              "country_code": "US",
              "is_receiving_mail": true,
              "not_receiving_mail_reason": null,
              "usage": "Residential",
              "delivery_point": "MultiUnit",
              "address_type": "Highrise",
              "lat_long": {
                "latitude": 33.218961,
                "longitude": -97.110657,
                "accuracy": "RoofTop"
              },
              "is_deliverable": true,
              "standard_address_line1": "600 Audra Ln Apt C",
              "standard_address_line2": "",
              "is_historical": true
            },
            {
              "id": {
                "key": "Location.3ca36724-4a62-4e24-b06e-8f3f884b16f7.Durable",
                "type": "Location",
                "durability": "Durable"
              },
              "type": "Address",
              "valid_for": {
                "start": {
                  "year": 2006,
                  "month": 9,
                  "day": 1
                },
                "stop": {
                  "year": 2007,
                  "month": 4,
                  "day": 1
                }
              },
              "legal_entities_at": [
                {
                  "id": {
                    "key": "Person.a47d7a95-9713-4988-9759-3e73ab35944e.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Leiley",
                      "middle_name": null,
                      "last_name": "Santos",
                      "suffix": null
                    }
                  ],
                  "age_range": {
                    "start": 30,
                    "end": 34
                  },
                  "gender": "Female",
                  "locations": null,
                  "phones": null
                }
              ],
              "city": "Lewisville",
              "postal_code": "75067",
              "zip4": "7880",
              "state_code": "TX",
              "country_code": "US",
              "is_receiving_mail": true,
              "not_receiving_mail_reason": null,
              "usage": "Residential",
              "delivery_point": "MultiUnit",
              "address_type": "Highrise",
              "lat_long": {
                "latitude": 33.007019,
                "longitude": -96.992174,
                "accuracy": "RoofTop"
              },
              "is_deliverable": true,
              "standard_address_line1": "165 Forestbrook Dr Apt 634",
              "standard_address_line2": "",
              "is_historical": true
            },
            {
              "id": {
                "key": "Location.4580fd52-27c0-4640-9423-174d71b3b98a.Durable",
                "type": "Location",
                "durability": "Durable"
              },
              "type": "Address",
              "valid_for": {
                "start": {
                  "year": 2005,
                  "month": 10,
                  "day": 5
                },
                "stop": {
                  "year": 2007,
                  "month": 7,
                  "day": 1
                }
              },
              "legal_entities_at": [
                {
                  "id": {
                    "key": "Person.a47d7a95-9713-4988-9759-3e73ab35944e.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Leiley",
                      "middle_name": null,
                      "last_name": "Santos",
                      "suffix": null
                    }
                  ],
                  "age_range": {
                    "start": 30,
                    "end": 34
                  },
                  "gender": "Female",
                  "locations": null,
                  "phones": null
                }
              ],
              "city": "Lewisville",
              "postal_code": "75067",
              "zip4": "8393",
              "state_code": "TX",
              "country_code": "US",
              "is_receiving_mail": true,
              "not_receiving_mail_reason": null,
              "usage": "Residential",
              "delivery_point": "MultiUnit",
              "address_type": "Highrise",
              "lat_long": {
                "latitude": 33.004361,
                "longitude": -96.985014,
                "accuracy": "RoofTop"
              },
              "is_deliverable": true,
              "standard_address_line1": "300 E Round Grove Rd Apt 1614",
              "standard_address_line2": "",
              "is_historical": true
            }
          ],
          "phones": [
            {
              "id": {
                "key": "Phone.44676fef-a2e2-4b08-cfe3-bc7128b496fc.Durable",
                "type": "Phone",
                "durability": "Durable"
              },
              "line_type": null,
              "belongs_to": null,
              "associated_locations": null,
              "is_valid": true,
              "phone_number": "9856492083",
              "country_calling_code": "1",
              "carrier": null,
              "is_prepaid": null,
              "is_connected": null,
              "valid_for": null,
              "contact_creation_date": 1475801670
            }
          ]
        },
        {
          "id": {
            "key": "Person.4c2220d8-12dd-4d79-9b09-4fa15be19d2b.Durable",
            "type": "Person",
            "durability": "Durable"
          },
          "names": [
            {
              "salutation": null,
              "first_name": "Claribel",
              "middle_name": null,
              "last_name": "Santos",
              "suffix": null
            }
          ],
          "age_range": {
            "start": 45,
            "end": 49
          },
          "gender": "Female",
          "locations": [
            {
              "id": {
                "key": "Location.4f579035-d026-4e0c-9f9b-d86dceff6307.Durable",
                "type": "Location",
                "durability": "Durable"
              },
              "type": "Address",
              "valid_for": {
                "start": {
                  "year": 2002,
                  "month": 9,
                  "day": 24
                },
                "stop": null
              },
              "legal_entities_at": [
                {
                  "id": {
                    "key": "Person.40d038bf-d052-434d-ae82-7d2d632e4ad5.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Alvin",
                      "middle_name": "E",
                      "last_name": "Santos",
                      "suffix": null
                    }
                  ],
                  "age_range": {
                    "start": 40,
                    "end": 44
                  },
                  "gender": "Male",
                  "locations": null,
                  "phones": null
                },
                {
                  "id": {
                    "key": "Person.0ad0da52-c258-49a2-8aed-69901562bcd2.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Claribel",
                      "middle_name": "A",
                      "last_name": "Diaz",
                      "suffix": null
                    }
                  ],
                  "age_range": {
                    "start": 40,
                    "end": 44
                  },
                  "gender": "Female",
                  "locations": null,
                  "phones": null
                },
                {
                  "id": {
                    "key": "Person.4c2220d8-12dd-4d79-9b09-4fa15be19d2b.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Claribel",
                      "middle_name": null,
                      "last_name": "Santos",
                      "suffix": null
                    }
                  ],
                  "age_range": {
                    "start": 45,
                    "end": 49
                  },
                  "gender": "Female",
                  "locations": null,
                  "phones": null
                }
              ],
              "city": "Slidell",
              "postal_code": "70461",
              "zip4": "5345",
              "state_code": "LA",
              "country_code": "US",
              "is_receiving_mail": true,
              "not_receiving_mail_reason": null,
              "usage": "Residential",
              "delivery_point": "SingleUnit",
              "address_type": "Street",
              "lat_long": {
                "latitude": 30.283626,
                "longitude": -89.730103,
                "accuracy": "RoofTop"
              },
              "is_deliverable": true,
              "standard_address_line1": "1003 Janette Ct",
              "standard_address_line2": "",
              "is_historical": false
            }
          ],
          "phones": []
        },
        {
          "id": {
            "key": "Person.1ec59b56-5d93-48d4-be4c-5e1e5c72900a.Durable",
            "type": "Person",
            "durability": "Durable"
          },
          "names": [
            {
              "salutation": null,
              "first_name": "Tiago",
              "middle_name": "Dos",
              "last_name": "Santos",
              "suffix": null
            }
          ],
          "age_range": null,
          "gender": null,
          "locations": [
            {
              "id": {
                "key": "Location.f6333c80-5790-49ba-875f-713332ffcbd3.Durable",
                "type": "Location",
                "durability": "Durable"
              },
              "type": "Address",
              "valid_for": null,
              "legal_entities_at": [
                {
                  "id": {
                    "key": "Person.1ec59b56-5d93-48d4-be4c-5e1e5c72900a.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Tiago",
                      "middle_name": "Dos",
                      "last_name": "Santos",
                      "suffix": null
                    }
                  ],
                  "age_range": null,
                  "gender": null,
                  "locations": null,
                  "phones": null
                },
                {
                  "id": {
                    "key": "Person.3afe3fb6-d63c-4b4a-9b26-34e40cede338.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Rania",
                      "middle_name": null,
                      "last_name": "Alabsa",
                      "suffix": null
                    }
                  ],
                  "age_range": null,
                  "gender": "Female",
                  "locations": null,
                  "phones": null
                },
                {
                  "id": {
                    "key": "Person.89b26c4f-0fc1-4563-9ca5-887f28aab112.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": "M.",
                      "first_name": "Marianne",
                      "middle_name": "E",
                      "last_name": "Barakat",
                      "suffix": null
                    },
                    {
                      "salutation": null,
                      "first_name": "Marianne",
                      "middle_name": "E",
                      "last_name": "Dolisi",
                      "suffix": null
                    }
                  ],
                  "age_range": {
                    "start": 40,
                    "end": 44
                  },
                  "gender": "Female",
                  "locations": null,
                  "phones": null
                },
                {
                  "id": {
                    "key": "Person.787ec8d2-9534-4d4f-b740-092b6a523aee.Durable",
                    "type": "Person",
                    "durability": "Durable"
                  },
                  "names": [
                    {
                      "salutation": null,
                      "first_name": "Wesley",
                      "middle_name": null,
                      "last_name": "Estevam",
                      "suffix": null
                    }
                  ],
                  "age_range": null,
                  "gender": null,
                  "locations": null,
                  "phones": null
                }
              ],
              "city": "Slidell",
              "postal_code": "70461",
              "zip4": "4434",
              "state_code": "LA",
              "country_code": "US",
              "is_receiving_mail": true,
              "not_receiving_mail_reason": null,
              "usage": "Residential",
              "delivery_point": "SingleUnit",
              "address_type": "Street",
              "lat_long": {
                "latitude": 30.251217,
                "longitude": -89.757965,
                "accuracy": "RoofTop"
              },
              "is_deliverable": true,
              "standard_address_line1": "1254 Kings Row",
              "standard_address_line2": "",
              "is_historical": false
            }
          ],
          "phones": []
        }
      ],
      "messages": []
    }'
  end
end