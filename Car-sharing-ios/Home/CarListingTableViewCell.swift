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
    @IBOutlet weak var title9: UILabel!
    @IBOutlet weak var title10: UILabel!
    @IBOutlet weak var title11: UILabel!
    @IBOutlet weak var title12: UILabel!
    @IBOutlet weak var title13: UILabel!

    @IBOutlet weak var imgView1: UIImageView!
    @IBOutlet weak var imgView2: UIImageView!
    @IBOutlet weak var imgView3: UIImageView!
    
    var buttonOneClicked: (() -> ())?
    var buttonTwoClicked: (() -> ())?

    @IBAction func butonTwoClicked(_ sender: Any) {
        
        buttonTwoClicked!()
        
    }
    
    @IBAction func buttonOneClicked(_ sender: Any) {
        
        buttonOneClicked!()

    }
    override func awakeFromNib() {
        super.awakeFromNib()

  

        
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
