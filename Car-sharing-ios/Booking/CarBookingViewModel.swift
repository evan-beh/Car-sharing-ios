//
//  CarBookingViewModel.swift
//  Car-sharing-ios
//
//  Created by Evan Beh on 16/09/2021.
//

import UIKit
import RxCocoa
import RxSwift

protocol CarBookingInput {
    
    func viewDidLoad()
    func endRide(index:Int) 

}

protocol CarBookingOutput {
    var bookingList: BehaviorRelay<[Booking]> { get }

}

class CarBookingViewModel : CarBookingInput , CarBookingOutput
{
 
  
   
    private let disposeBag = DisposeBag()

    public var viewType:viewType?

    let bookingList = BehaviorRelay<[Booking]>(value: [])

    func viewDidLoad() {
        
        switch viewType {
        case .active:
            
            self.bookingList.accept(StoreManager.shared.activeList.value)
            StoreManager.shared.activeList
                .observe(on: MainScheduler.asyncInstance)
                .subscribe(onNext: { [weak self] array in
                    self?.bookingList.accept(array)
                })
                .disposed(by: disposeBag)
            break
            
        case .upcoming:
            self.bookingList.accept(StoreManager.shared.upcomingList.value)

            StoreManager.shared.upcomingList
                .observe(on: MainScheduler.asyncInstance)
                .subscribe(onNext: { [weak self] array in
                    self?.bookingList.accept(array)
                })
                .disposed(by: disposeBag)
            break
            
        case .ended:
            
            self.bookingList.accept(StoreManager.shared.endedList.value)

            StoreManager.shared.endedList
                .observe(on: MainScheduler.asyncInstance)
                .subscribe(onNext: { [weak self] array in
                    self?.bookingList.accept(array)
                })
                .disposed(by: disposeBag)
            break
        default:break
            
        }
        
    }
    
    func endRide(index:Int) {
        
        var bookings = self.bookingList.value
        
        let booking = self.bookingList.value[index]
        
        bookings.remove(at: index)

        switch viewType {
        case .active:
            
            StoreManager.shared.activeList.accept(bookings)
            var array =  StoreManager.shared.endedList.value
            array.append(booking)
            StoreManager.shared.endedList.accept(array)
            
            break
        case .upcoming:
            
            StoreManager.shared.upcomingList.accept(bookings)
            var array =  StoreManager.shared.endedList.value
            array.append(booking)
            StoreManager.shared.endedList.accept(array)
            
            break
        case .ended:
            break
        default:
            break
        }
     
     
    
    }
    

}
