//
//  RestaurantDetailIconTextCell.swift
//  learn-iOS-FoodPin
//
//  Created by levypan on 11/20/20.
//

import UIKit



class RestaurantDetailIconTextCell: UITableViewCell {
	// MARK: - IBOutlet
	@IBOutlet var iconImageView: UIImageView!
	@IBOutlet var shortTextLabel : UILabel! {
		didSet{
			shortTextLabel.numberOfLines = 0
		}
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
