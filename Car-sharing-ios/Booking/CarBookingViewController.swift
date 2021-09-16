//
//  CarOrderListingViewController.swift
//  Car-sharing-ios
//
//  Created by Evan Beh on 15/09/2021.
//

import UIKit

class CarBookingViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "something"
        setUpTableView()
        // Do any additional setup after loading the view.
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CarBookingViewController: UITableViewDelegate, UITableViewDataSource
{
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 290
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    
    
    private func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = UIColor.clear


        tableView.register(UINib(nibName: "CarListingTableViewCell", bundle: nil), forCellReuseIdentifier: "cell1")


    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! CarListingTableViewCell

        
        
        let url = URL.init(string: "https://w7.pngwing.com/pngs/1018/756/png-transparent-2018-mazda-cx-5-mazda6-car-mazda3-mazda-compact-car-car-mazda6.png")
        
        cell.imageView?.af.setImage(withURL: url!)
        
        cell.title1.text = "Mazda Mazda2"
        cell.title2.text = "www1234"
        cell.title3.text = "Setia Alam Welcome Centre"
        cell.title4.text = "100%"
        cell.title5.text = "9.7km"
        cell.title6.text = "RM14.55"
        cell.title7.text = "RM12.50"
        cell.title8.text = "For 1 hour,0 minute"

    
        return cell
        
    }


}
