//
//  Card.swift
//  learn-iOS-Concentration
//
//  Created by levypan on 10/9/20.
//  Copyright © 2020 Googo. All rights reserved.
//

import Foundation

struct Card {
	var identifier : Int = 0
	var isFaceUp = false
	var isMatched = false
	
	static var identifierFactory = 0
	static func getUniqueIdentifier() -> Int {
		identifierFactory += 1
		return identifierFactory
	}
	
	init() {
		self.identifier = Card.getUniqueIdentifier()
	}
}
