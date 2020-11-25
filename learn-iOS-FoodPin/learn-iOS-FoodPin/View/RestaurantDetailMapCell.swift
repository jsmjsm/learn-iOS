//
//  RestaurantDetailMapCell.swift
//  learn-iOS-FoodPin
//
//  Created by levypan on 11/20/20.
//

import UIKit
import MapKit

class RestaurantDetailMapCell: UITableViewCell {
	@IBOutlet var mapView : MKMapView!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
