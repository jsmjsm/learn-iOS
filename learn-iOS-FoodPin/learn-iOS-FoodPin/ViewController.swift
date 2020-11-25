//
//  ViewController.swift
//  learn-iOS-FoodPin
//
//  Created by levypan on 10/25/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	// MARK: data
	var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oy ster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Choc olate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", " Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia" , "Royal Oak", "CASK Pub and Kitchen"]

	// MARK: Table View
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return restaurantNames.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cellIdentifier = "datacell"
		let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
		
		// Set the cell
		cell.textLabel?.text =  restaurantNames[indexPath.row]
		cell.imageView?.image = UIImage(named: cell.textLabel?.text ?? "SampleImage")
		
		
		return cell
	}
	
	override var prefersStatusBarHidden: Bool{
		return false
	}


	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}



}

