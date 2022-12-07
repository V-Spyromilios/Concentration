//
//  ViewController.swift
//  Concentration
//
//  Created by Evangelos Spyromilios on 05.12.22.
//

import UIKit

class ViewController: UIViewController {
	
	private var numberOfPairs: Int {
		return buttonsArray.count % 2 == 0 ? buttonsArray.count / 2 : buttonsArray.count + 1 / 2 }
	
	lazy var game = Concentration(numberOfPairsOfCards: numberOfPairs )
	
	private var score = 0 {
		didSet {
			scoreCounterOutlet.text = "Score: \(score)"
		}
	}
	
	var flipCounter = 0 {
		didSet {
			flipCounterView.text = "Flips: \(flipCounter)"
		}
	}
	
	@IBOutlet private var scoreCounterOutlet: UILabel!
	@IBOutlet private var buttonsArray: [UIButton]!
	@IBOutlet private var flipCounterView: UILabel!
	
	private var emojiArray = ["📱", "👻", "💣", "😎", "🎉"]
	private var emojiDict = [Int:String]()
	
	
	@IBAction func pressButton(_ sender: UIButton) {
		
		if let buttonIndex = buttonsArray.firstIndex(of: sender) {
			flipCounter += 1
			game.chooseCard(at: buttonIndex)
			updateViewFromModel()
		}
	}
	

	private func updateViewFromModel() {
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

	private func chooseEmoji(for card: Card) -> String {
		if emojiDict[card.identifier] == nil, emojiArray.count > 0 {
			let randomInt = emojiArray.count.arc4random
			emojiDict[card.identifier] = emojiArray.remove(at: randomInt) //  .remove returns the removed
		}
		return emojiDict[card.identifier] ?? "NIL"
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		updateViewFromModel()
	}
}

extension Int {
	var arc4random: Int {
		if self > 0 {
			return Int( arc4random_uniform(UInt32(self)))
		}
		else if self < 0 {
			return Int( arc4random_uniform(UInt32(abs(self))))
		}
		else { return 0 }
	}
}
