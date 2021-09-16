//
//  CarListingTableViewCell.swift
//  Car-sharing-ios
//
//  Created by Evan Beh on 15/09/2021.
//

import UIKit

class CarListingTableViewCell: UITableViewCell {

    @IBOutlet weak var contentView1: CardView!
    @IBOutlet weak var title1: UILabel!
    @IBOutlet weak var title2: UILabel!
    @IBOutlet weak var title3: UILabel!
    @IBOutlet weak var title4: UILabel!
    @IBOutlet weak var title5: UILabel!
    @IBOutlet weak var title6: UILabel!
    @IBOutlet weak var title7: UILabel!
    @IBOutlet weak var title8: UILabel!
    @IBOutlet weak var imgView1: UIImageView!
    @IBOutlet weak var imgView2: UIImageView!
    @IBOutlet weak var imgView3: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()

        let image1 = UIImage(named: "petrol-station")!.withRenderingMode(.alwaysTemplate)

        imgView2.image = image1

        imgView2.tintColor = UIColor.systemTeal
        
        
        let image2 = UIImage(named: "location-pin")!.withRenderingMode(.alwaysTemplate)

        imgView3.image = image2

        imgView3.tintColor = UIColor.systemTeal

        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
