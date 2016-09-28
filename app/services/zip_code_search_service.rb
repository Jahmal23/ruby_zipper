class ZipCodeSearchService

  def get_names_for_zip_code(zip_code)
    ZipCodeSearchService.fake_white_page_search_results
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
end