//
//  RestaurentDetailTwoCell.swift
//  HelloWorldTest
//
//  Created by Ajin on 15/08/22.
//

import UIKit

class RestaurentDetailTwoCell: UITableViewCell {

    @IBOutlet weak var column1TitleLabel: UILabel!
    @IBOutlet weak var column1TextLabel: UILabel!
    @IBOutlet weak var column2TitleLabel: UILabel!
    @IBOutlet weak var column2textLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
