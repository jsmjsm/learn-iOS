//
//  RestaurantDetailHeaderView.swift
//  learn-iOS-FoodPin
//
//  Created by levypan on 11/20/20.
//

import UIKit

class RestaurantDetailHeaderView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
	@IBOutlet var headerImageView : UIImageView!
	@IBOutlet var nameLabel : UILabel! {
		didSet {
			nameLabel.numberOfLines = 0;
		}
	}
	@IBOutlet var typeLabel : UILabel!{
		didSet {
			typeLabel.layer.cornerRadius = 5.0
			typeLabel.layer.masksToBounds = true
		}
	}
	@IBOutlet var heartImageView : UIImageView! {
		didSet {
			headerImageView.image = UIImage(named: "heart-tick")?.withRenderingMode(.alwaysTemplate)
			heartImageView.tintColor = .white
		}
	}

}
