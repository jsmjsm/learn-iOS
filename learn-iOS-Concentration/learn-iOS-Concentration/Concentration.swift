//
//  Concentration.swift
//  learn-iOS-Concentration
//
//  Created by levypan on 10/9/20.
//  Copyright © 2020 Googo. All rights reserved.
//

import Foundation

class Concentration {
	var cards = [Card]()
	
	init(numberOfPairsOfCards: Int) {
		for _ in 0..<numberOfPairsOfCards {
			let card = Card()
			cards += [card,card]
		}
		
		// Shuffle the cards
		for _ in cards.indices {
			let index = Int(arc4random_uniform(UInt32(cards.count)))
			let card = cards.remove(at: index)
			cards.append(card)
		}
	}
	
//	func chooseCard(at index : Int){
//		if cards[index].isFaceUp {
//			cards[index].isFaceUp = false
//		}else{
//			cards[index].isFaceUp = true
//		}
//	}
	
	var indexOfOneAndOnlyFaceUpCard : Int?
	
	func chooseCard(at index: Int) {
		if (!cards[index].isMatched) {
			if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
				if cards[matchIndex].identifier == cards[index].identifier {
					cards[matchIndex].isMatched = true
					cards[index].isMatched = true
				}
				cards[index].isFaceUp = true
				indexOfOneAndOnlyFaceUpCard = nil
			} else {
				// either no cards or 2 cards are faced up
				for flipDownIndex in cards.indices {
					cards[flipDownIndex].isFaceUp = false
				}
				cards[index].isFaceUp = true
				indexOfOneAndOnlyFaceUpCard = index
			}
		}
	}
	
	
	
}
