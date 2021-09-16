//
//  CarListingViewModel.swift
//  Car-sharing-ios
//
//  Created by Evan Beh on 15/09/2021.
//

import UIKit
import RxSwift
import RxCocoa

protocol CarListingInput {
    
    func viewDidLoad()
    
}

protocol CarListingOutput {
    var carList: BehaviorRelay<[Car]> { get }

}

class CarListingViewModel: CarListingInput, CarListingOutput {

    let carList = BehaviorRelay<[Car]>(value: [])

    func viewDidLoad() {
        
        CarApiService().getCarList { cars in
            self.carList.accept(cars)

            
        }
    }
    

}
