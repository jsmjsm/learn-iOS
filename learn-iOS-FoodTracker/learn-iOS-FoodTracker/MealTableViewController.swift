//
//  MealTableViewController.swift
//  learn-iOS-FoodTracker
//
//  Created by levypan on 10/14/20.
//

import UIKit

class MealTableViewController: UITableViewController {

	//MARK: Properties
	 
	var meals = [Meal]()
	
	
	// MARK: Private Methods
	private func loadSampleMeals(){
		let photo1 = UIImage(named: "meal1")
		let photo2 = UIImage(named: "meal2")
		let photo3 = UIImage(named: "meal3")
		
		let meal1 = Meal(name: "Caprese Salad", photo: photo1, rating: 4)
		let meal2 = Meal(name: "Chicken and Potatoes", photo: photo2, rating: 5)
		let meal3 = Meal(name: "Pasta with Meatballs", photo: photo3, rating: 5)
		
		guard meal1 != nil else {
			fatalError("Unable to instantiate meal1")
		}
		
		guard meal2 != nil else {
			fatalError("Unable to instantiate meal2")
		}
		
		guard meal3 != nil else {
			fatalError("Unable to instantiate meal3")
		}
		
		// MARK: unfinished: add the meal to the meals
		
	}
	

	override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

   
}
