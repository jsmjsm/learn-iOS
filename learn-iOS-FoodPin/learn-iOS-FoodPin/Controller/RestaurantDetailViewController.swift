//
//  RestaurantDetailViewController.swift
//  learn-iOS-FoodPin
//
//  Created by levypan on 11/10/20.
//

import UIKit

class RestaurantDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 5
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		switch  indexPath.row {
		
		case 0:
			let cell = tableView.dequeueReusableCell(withIdentifier: String(describing : RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
			cell.iconImageView.image = UIImage(named: "phone")
			cell.shortTextLabel.text = restaurant.phone
			cell.selectionStyle = .none
			
			return cell
		case 1:
			let cell = tableView.dequeueReusableCell(withIdentifier: String(describing : RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
			cell.iconImageView.image = UIImage(named: "map")
			cell.shortTextLabel.text = restaurant.location
			cell.selectionStyle = .none
			
			return cell
		case 2:
			let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailTextCell.self), for: indexPath) as! RestaurantDetailTextCell
			cell.descriptionLabel.text = restaurant.description
			cell.selectionStyle = .none
			
			return cell
		case 3:
			let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailSeparatorCell.self),for: indexPath) as! RestaurantDetailSeparatorCell
			cell.titleLabel.text = "HOW TO GET THERE"
			cell.selectionStyle = .none
			
			return cell
		case 4:
			let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailMapCell.self), for: indexPath) as! RestaurantDetailMapCell
			cell.selectionStyle = .none
			
			return cell
			
			
		default:
			fatalError("Failed to instantiate the table view cell for detail view cont roller")
		}
	}
	
	
	@IBOutlet var restaurantImageView: UIImageView!
	@IBOutlet var nameLabel: UILabel!
	@IBOutlet var locationLabel: UILabel!
	@IBOutlet var typeLabel: UILabel!
	
	@IBOutlet var tableView: UITableView!
	@IBOutlet var headerView: RestaurantDetailHeaderView!
	
	var restaurant = Restaurant()

	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		navigationItem.largeTitleDisplayMode = .never

        // Do any additional setup after loading the view.
		headerView.nameLabel.text = restaurant.name
		headerView.typeLabel.text = restaurant.type
		headerView.headerImageView.image = UIImage(named: restaurant.image)
		headerView.heartImageView.isHidden = (restaurant.isVisited) ? false : true
		tableView.delegate = self
		tableView.dataSource = self
		tableView.separatorStyle = .none
		
    }
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.hidesBarsOnSwipe = false
		navigationController?.setNavigationBarHidden(false, animated: true)
	}
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
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
