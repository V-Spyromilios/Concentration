//
//  ViewController.swift
//  Concentration
//
//  Created by Evangelos Spyromilios on 05.12.22.
//

import UIKit

class ViewController: UIViewController {
	
	lazy var game = Concentration(numberOfPairsOfCards: (buttonsArray.count) / 2)
	
	var score = 0 {
		didSet {
			scoreCounterOutlet.text = "Score: \(score)"
		}
	}
	
	var flipCounter = 0 {
		didSet {
			flipCounterView.text = "Flips: \(flipCounter)"
		}
	}
	
	@IBOutlet var scoreCounterOutlet: UILabel!
	@IBOutlet var buttonsArray: [UIButton]!
	@IBOutlet var flipCounterView: UILabel!
	
	var emojiArray = ["📱", "👻", "💣", "😎", "🎉"]
	var lastPressedButton: UIButton? = nil
	var emojiDict = [Int:String]()
	
	
	@IBAction func pressButton(_ sender: UIButton) {
		
		if let buttonIndex = buttonsArray.firstIndex(of: sender) {
			flipCounter += 1
			game.chooseCard(at: buttonIndex)
			updateViewFromModel()
		}
	}
	
	
	func updateViewFromModel() {
		for index in buttonsArray.indices {
			let button = buttonsArray[index]
			let card = game.cards[index]
			if card.isFaceUp {
				button.setTitle(chooseEmoji(for: card), for: .normal)
				button.backgroundColor = .white
				
			}
			else {
				button.setTitle("", for: .normal)
				button.backgroundColor = card.isMatched ? .clear: .orange
			}
		}
	}
	
	func chooseEmoji(for card: Card) -> String {
		if emojiDict[card.identifier] == nil, emojiArray.count > 0 {
			print("BIKE")
			let randomInt = Int( arc4random_uniform(UInt32(emojiArray.count)) )
			emojiDict[card.identifier] = emojiArray.remove(at: randomInt) // remove returns the removed
		}
		print("ChooseEmoji()")
		print("\(String(describing: emojiDict[card.identifier]))")
		return emojiDict[card.identifier] ?? "NIL"
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		updateViewFromModel()
	}
}
