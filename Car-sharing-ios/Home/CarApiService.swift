//
//  CarApiService.swift
//  Car-sharing-ios
//
//  Created by Evan Beh on 16/09/2021.
//

import UIKit
import CodableFirebase
import FirebaseDatabase


import Firebase


protocol getCarListInterface {
    func getCarList(completion: @escaping ([Car]) -> Void)
}

let fb_url = "https://car-sharing-6c434-default-rtdb.asia-southeast1.firebasedatabase.app/"

class CarApiService: getCarListInterface {
    
    func getCarList(completion: @escaping ([Car]) -> Void) {
        var ref: DatabaseReference!
        
        ref = Database.database(url: fb_url).reference()



        
        ref.child("cars").getData { error, snapshot in
            guard let value = snapshot.json else { return }
            do {
                
                let cars = try! JSONDecoder().decode([Car].self, from: value.data(using: .utf8)!)
                
                completion(cars)
            }
        }
    }
    
 
    
 
}
