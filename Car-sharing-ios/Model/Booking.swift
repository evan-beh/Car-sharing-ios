//
//  Booking.swift
//  Car-sharing-ios
//
//  Created by Evan Beh on 16/09/2021.
//

import UIKit


protocol BookingDetails
{
    var status: String { get }
    var datetime: String { get }
    var remaining_period: String { get }
    var remaining_mileage: String { get }
    var total_period: String { get }
    var total_mileage: String { get }
}
protocol Member
{
    var email: String { get }
  
}

struct Booking: Codable, BookingDetails, Member
{
    var total_period: String
    
    var total_mileage: String
    
    var email: String
    
    var status: String
    
    var datetime: String
    
    var remaining_period: String
    
    var remaining_mileage: String
    
    var car: Car
    
    
    
    init() {
        total_period = ""
        total_mileage = ""
        email = ""
        status = ""
        datetime = ""
        remaining_period = ""
        remaining_mileage = ""
        car = Car()

    }

}
