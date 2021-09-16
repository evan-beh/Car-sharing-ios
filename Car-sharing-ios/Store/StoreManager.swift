//
//  StoreManager.swift
//  Car-sharing-ios
//
//  Created by Evan Beh on 16/09/2021.
//

import UIKit
import RxCocoa

class StoreManager {

    // MARK: - Properties

    static let shared = StoreManager()

    var activeList = BehaviorRelay<[Booking]>(value: [])
    var upcomingList = BehaviorRelay<[Booking]>(value: [])
    var endedList = BehaviorRelay<[Booking]>(value: [])

    
}
