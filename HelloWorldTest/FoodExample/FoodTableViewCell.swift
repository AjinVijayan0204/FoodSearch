//
//  FoodTableViewCell.swift
//  HelloWorldTest
//
//  Created by Ajin on 12/08/22.
//

import UIKit

class FoodTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!{
        didSet{
            thumbnailImageView.layer.cornerRadius = thumbnailImageView.bounds.width/2
            thumbnailImageView.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var favouriteImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
