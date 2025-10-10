//
//  Address.swift
//  
//
//  Created by Leila on 10.10.2025.
//

struct Address {
    var street: String
    var city: String
    var zipcode: String
    var country: String
    
    var formattedAddress: String {
        """
        \(street)
        \(city)
        \(zipcode)
        \(country)
        """
    }
}




