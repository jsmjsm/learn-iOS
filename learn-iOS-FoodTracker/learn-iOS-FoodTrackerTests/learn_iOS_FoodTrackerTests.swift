//
//  learn_iOS_FoodTrackerTests.swift
//  learn-iOS-FoodTrackerTests
//
//  Created by levypan on 10/14/20.
//

import XCTest
@testable import learn_iOS_FoodTracker

class learn_iOS_FoodTrackerTests: XCTestCase {
	// MARK: Meal Class Tests
	// Confirm that the Meal initalizer returns a Meal object when passed valid parameters.
	
	func testMealInitializationSucceeds(){
		// Zero rating
		let zeroRatingMeal = Meal.init(name: "Zer0", photo: nil, rating: 0)
		XCTAssertNotNil(zeroRatingMeal)
		
		// Highest positive rating
		let positiveRatingMeal = Meal.init(name: "Positive", photo: nil, rating: 5)
		XCTAssertNotNil(positiveRatingMeal)
	}
	
	// Confirm that the Meal initialier returns nil when passed a negative rating or an empty name.
	func testMealInitializationFails(){
		// Negative rating
		let negativeRatingMeal = Meal.init(name: "Negative", photo: nil, rating: -1)
		XCTAssertNil(negativeRatingMeal)
		
		// Empty String
		let emptyStringMeal = Meal.init(name: "", photo: nil, rating: 0)
		XCTAssertNil(emptyStringMeal)
		
		// Rating exceeds maximum
		let largeRatingMeal = Meal.init(name: "Large", photo: nil, rating: 6)
		XCTAssertNil(largeRatingMeal)
	}
}
