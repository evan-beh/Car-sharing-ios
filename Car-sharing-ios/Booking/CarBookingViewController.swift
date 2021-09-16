//
//  CarOrderListingViewController.swift
//  Car-sharing-ios
//
//  Created by Evan Beh on 15/09/2021.
//

import UIKit
import RxSwift
import RxCocoa

enum viewType {
    case active
    case upcoming
    case ended

}

protocol BookingTabDelegate : AnyObject
{
    func routeTo(index:Int)
    
}


class CarBookingViewController: UIViewController {
  
    private let disposeBag = DisposeBag()
    weak  var delegate: BookingTabDelegate?

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = CarBookingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "something"
        setUpTableView()
        
        viewModel.viewDidLoad()
        setupBinding()
        // Do any additional setup after loading the view.
    }
    

    
    func setupBinding()
    {
        viewModel.bookingList.asObservable()
            .observe(on: MainScheduler.asyncInstance)
            .subscribe(onNext: { [weak self] _ in
                self?.tableView.reloadData()
            })
            .disposed(by: disposeBag)
        
    }
}

extension CarBookingViewController: UITableViewDelegate, UITableViewDataSource
{
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch viewModel.viewType {
        case .active:
            return 500
      
            
        case .upcoming:
            return 430
        case .ended:
            return 290
        default:
            return 100

        }    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        switch viewModel.viewType {

        default:
            return viewModel.bookingList.value.count

        }

    }
    
    
    private func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = UIColor.clear


        tableView.register(UINib(nibName: "CarBookingActiveTableViewCell", bundle: nil), forCellReuseIdentifier: "cell1")
        tableView.register(UINib(nibName: "CarBookingUpcomingTableViewCell", bundle: nil), forCellReuseIdentifier: "cell2")
        tableView.register(UINib(nibName: "CarBookingEndedTableViewCell", bundle: nil), forCellReuseIdentifier: "cell3")

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (viewModel.viewType == .active)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! CarListingTableViewCell

            
            let item = viewModel.bookingList.value[indexPath.row]

            let url = URL.init(string: item.car.image_url)
            
            cell.imgView1?.af.setImage(withURL: url!)
            cell.title1.text = "\u{2022} Driving"
            cell.title2.text = item.car.plate_number
            cell.title3.text = String(item.car.make + " " + item.car.name)
            cell.title4.text = item.car.petrol_level
            cell.title5.text = item.remaining_period
            cell.title6.text = "time left"
            cell.title7.text = item.total_period
            cell.title8.text = "Extend time"
            cell.title9.text = item.remaining_mileage
            cell.title10.text = "Mileage Left"
            cell.title11.text = String("Total " + item.remaining_mileage)
            cell.title12.text = "Add mileage"
            cell.title13.text = item.email

  
            stylingForTyle(cell:cell)

            cell.buttonOneClicked = {
                
                
                let alert = UIAlertController(title: "", message: "Hurray, found your car!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    switch action.style{
                        case .default:
                        print("default")
                        
                        case .cancel:
                        print("cancel")
                        
                        case .destructive:
                        print("destructive")
                        
                    @unknown default:
                        break
                    }
                }))
                
                
                self.present(alert, animated: true, completion: nil)

            }
            
            cell.buttonTwoClicked = {
                
                self.viewModel.endRide(index: indexPath.row)
                
                
                self.delegate?.routeTo(index: 2)

                
            }
            
            return cell

        
        }
        else if (viewModel.viewType == .upcoming)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! CarListingTableViewCell

            
            let item = viewModel.bookingList.value[indexPath.row]

            let url = URL.init(string: item.car.image_url)

            cell.imgView1?.af.setImage(withURL: url!)
            cell.title1.text = "\u{2022} Upcoming"
            cell.title2.text = item.car.plate_number
            cell.title3.text = String(item.car.make + " " + item.car.name)
            cell.title4.text = item.car.petrol_level
            cell.title5.text = item.total_period
            cell.title6.text = "Driving time"
            cell.title9.text = item.total_mileage
            cell.title10.text = "Driving mileage"
            cell.title12.text = item.datetime
            cell.title13.text = item.email


        
        
            stylingForTyle(cell:cell)
            cell.buttonOneClicked = {
                
                self.viewModel.endRide(index: indexPath.row)

                self.delegate?.routeTo(index: 2)
            }
            
            return cell
        
        }
        else if (viewModel.viewType == .ended)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! CarListingTableViewCell

            let item = viewModel.bookingList.value[indexPath.row]
            let url = URL.init(string: item.car.image_url)


            cell.imgView1?.af.setImage(withURL: url!)
            cell.title1.text = "\u{2022} Ended"
            cell.title2.text = item.car.plate_number
            cell.title3.text = String(item.car.make + " " + item.car.name)
            cell.title5.text = item.remaining_period
            cell.title6.text = "time consumed"
            cell.title7.text = String("of " + item.total_period)

            cell.title9.text = item.remaining_mileage
            cell.title10.text = "Mileage consumed"
            cell.title11.text = String("of " + item.total_mileage)
            cell.title12.text = item.datetime

            stylingForTyle(cell:cell)

            
            cell.buttonOneClicked = {
                
                self.tabBarController?.selectedIndex = 0
            }
            
            
            return cell
        }
        return UITableViewCell()

    }
    
    
    func stylingForTyle(cell:CarListingTableViewCell)
    {
        
        switch viewModel.viewType {
        case .active:
            
            let image1 = UIImage(named: "petrol-station")!.withRenderingMode(.alwaysTemplate)
            cell.imgView2.image = image1
            cell.imgView2.tintColor = UIColor.systemTeal
            cell.title1.textColor = .systemGreen
            cell.title13.textColor = .darkGray

            break
        case .upcoming:
            let image1 = UIImage(named: "petrol-station")!.withRenderingMode(.alwaysTemplate)
            cell.imgView2.image = image1
            cell.imgView2.tintColor = UIColor.systemTeal
            cell.title1.textColor = .systemYellow
            cell.title13.textColor = .darkGray

            break
        case .ended:
            cell.title1.textColor = .systemGray
            cell.title2.backgroundColor = .systemGray
            break

        default:break
            
        }
    }


}
