//
//  LandingViewViewController.swift
//  Car-sharing-ios
//
//  Created by Evan Beh on 15/09/2021.
//

import UIKit
import AlamofireImage

import RxSwift

class CarListingViewController: UIViewController {
   
    
    private let disposeBag = DisposeBag()

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = CarListingViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        setUpTableView()
        setupBinding()
        self.viewModel.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func setupBinding()
    {
        
        self.viewModel.carList.asObservable()
            .observe(on: MainScheduler.asyncInstance)
            .subscribe(onNext: { [weak self] _ in
                self?.tableView.reloadData()
            })
            .disposed(by: disposeBag)
    }


}

extension CarListingViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = self.viewModel.carList.value[indexPath.row]

        promptBooking(car:item)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 290
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.carList.value.count
    }
    
    
    
    private func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = UIColor.clear


        tableView.register(UINib(nibName: "CarListingTableViewCell", bundle: nil), forCellReuseIdentifier: "cell1")


    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! CarListingTableViewCell

        
        
        
        let item = self.viewModel.carList.value[indexPath.row]
        
        let url = URL.init(string: item.image_url)

        cell.imgView1?.af.setImage(withURL: url!)
        
        cell.title1.text = String(item.make + " " + item.name)
        cell.title2.text = item.plate_number
        cell.title3.text = item.location
        cell.title4.text = item.petrol_level
        cell.title5.text = item.distance
        cell.title6.text = item.ori_price
        cell.title7.text = item.price
        cell.title8.text = item.duration

        let image1 = UIImage(named: "petrol-station")!.withRenderingMode(.alwaysTemplate)
        cell.imgView2.image = image1
        cell.imgView2.tintColor = UIColor.systemTeal
        let image2 = UIImage(named: "location-pin")!.withRenderingMode(.alwaysTemplate)
        cell.imgView3.image = image2
        cell.imgView3.tintColor = UIColor.systemTeal
        
       
        
        return cell
        
    }
    
    func promptBooking(car:Car)
    {
        
        
        
        let alert = UIAlertController(title: "", message: "When do you want to book this car?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Now", style: .default, handler: { action in
            switch action.style{
                case .default:
                print("default")
                    
                    var booking = Booking()
                    booking.email = "testing@gmail.com"
                    booking.car = car
                    booking.remaining_mileage = "100km"
                    booking.remaining_period = "12min"
                    booking.total_period = "120min"
                    booking.total_mileage = "120km"
                    booking.datetime = "18 October 2021"
                    
                    var array =  StoreManager.shared.activeList.value
                    array.append(booking)
                    StoreManager.shared.activeList.accept(array)
                    
                    
                    self.tabBarController?.selectedIndex = 1

                    
                    if let nav = self.tabBarController?.viewControllers?[1] as? UINavigationController {
                       
                       if let bookingMain = nav.viewControllers.first as? CarBookingMainViewController
                        {
                            bookingMain.routeTo(index: 0)
                            
                        }
                    }
                    
                
                case .cancel:
                print("cancel")
                
                case .destructive:
                print("destructive")
                
            @unknown default:
                break
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Later", style: .default, handler: { action in
            switch action.style{
                case .default:
                print("default")
                    
                    var booking = Booking()
                    booking.email = "testing@gmail.com"
                    booking.car = car
                    booking.remaining_mileage = "100km"
                    booking.remaining_period = "12min"
                    booking.total_period = "120min"
                    booking.total_mileage = "120km"
                    booking.datetime = "18 November 2021"

                    
                    var array =  StoreManager.shared.upcomingList.value
                    array.append(booking)
                    StoreManager.shared.upcomingList.accept(array)
                    
                    self.tabBarController?.selectedIndex = 1
                    
                    if let nav = self.tabBarController?.viewControllers?[1] as? UINavigationController {
                       
                       if let bookingMain = nav.viewControllers.first as? CarBookingMainViewController
                        {
                            bookingMain.routeTo(index: 1)
                            
                        }
                    }

                case .cancel:
                print("cancel")
                
                case .destructive:
                print("destructive")
                
            @unknown default:
                break
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:nil))
        
        self.present(alert, animated: true, completion: nil)
    }


}
