//
//  Car.swift
//  Car-sharing-ios
//
//  Created by Evan Beh on 16/09/2021.
//

import UIKit

protocol Price
{
    var ori_price: String { get }
    var price: String { get }
    
}

protocol CarDetails
{
    var name: String { get }
    var make: String { get }
    var plate_number: String { get }
    var image_url: String { get }

}

protocol CarStatus
{
    var location: String { get }
    var petrol_level: String { get }
    var distance: String { get }
    var duration: String { get }
  //  var availability: Bool { get }


}

struct Car: Codable, Price ,CarDetails ,CarStatus {
 //   var availability: Bool
    
    var image_url: String
    
    var name: String
    
    var make: String
    
    var plate_number: String
    
    let ori_price: String
    
    let price: String
    
    let location: String
    
    let petrol_level: String
    
    let distance: String
  
    let duration: String

    
    init() {
        
        image_url = ""
        name = ""
        make = ""
        plate_number = ""
        ori_price = ""
        price = ""
        location = ""
        petrol_level = ""
        distance = ""
        duration = ""
    
    }
}

