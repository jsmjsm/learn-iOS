//
//  ViewController.swift
//  learn-iOS-Concentration
//
//  Created by levypan on 10/8/20.
//  Copyright © 2020 Googo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	override func viewDidLoad() {
		print("we have \(numOfEmoji)")
	}
	
	@IBOutlet weak var flipCountLabel: UILabel!

	// var flipCount : Int = 0
	var flipCount : Int = 0
	{
		didSet{
			flipCountLabel.text = "Flips Count: \(flipCount)"
		}
	}

	@IBOutlet var cardButtons: [UIButton]!
	
//	var emojiChoices = ["🎃","👻 ","🎃","👻",]
	
	lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)

	func flipCard(withEmoji emoji : String, on button : UIButton) {
		if(button.currentTitle == emoji) {
			button.setTitle("", for: .normal)
			button.backgroundColor = UIColor.orange
		}
		else {
			button.setTitle(emoji, for: .normal)
			button.backgroundColor = UIColor.white
		}
	}

	@IBAction func touchCard(_ sender: UIButton) {
		var touchResult : Bool = false
		flipCount += 1
		if let cardNumber = cardButtons.firstIndex(of: sender){
			game.chooseCard(at: cardNumber)
			touchResult = updateViewFromModel()
		}else {
			print("chosed card is not in cardButtons")
		}
		
		if touchResult == true{
			numOfEmoji = numOfEmoji - 1
		}
		
		print(numOfEmoji)
		
		if numOfEmoji <= 1 {
			flipCountLabel.text = "You made it!!!"
		}
	}
	
	func updateViewFromModel() -> Bool {
		var result : Bool = false
		for index in cardButtons.indices{
			let button = cardButtons[index]
			let card = game.cards[index]
			
			if card.isFaceUp{
				// MARK:  Problem
				button.setTitle(emoji(for:card), for: .normal)
				button.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
			}else {
				button.setTitle("", for: .normal)
				button.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)//card.isMatched ? UIColor(red: 1, green: 0.5763723254, blue: 0, alpha: 0)  :  UIColor(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
			}
			result = card.isMatched
		}
		return result
	}
	
	var emojiChoices = ["🎃","👻","🦇","😈","🙀","😱","🍭","🍬",]
	
	lazy var numOfEmoji: Int = cardButtons.count
	
	var emoji = [Int : String] ()
	
	func emoji(for card : Card) -> String {
		if emoji[card.identifier] == nil && emojiChoices.count > 0 {
			let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
			emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
		}
		return emoji[card.identifier] ?? "?"
	}
	
}

