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

	let attributes:[NSAttributedString.Key: Any] = [
		.strokeWidth: 2.0,
		.strokeColor : UIColor.orange
	]
	
	private var score = 0 {
		didSet {
			let scoreAttributedString = NSAttributedString(string: "Score: \(score)", attributes: attributes)
			scoreCounterOutlet.attributedText = scoreAttributedString
		}
	}
	
	var flipCounter = 0 {
		didSet {
			let flipAttributedString = NSAttributedString(string: "Flips: \(flipCounter)", attributes: attributes)
			flipCounterView.attributedText = flipAttributedString
			
		}
	}
	
	@IBOutlet private var buttonsArray: [UIButton]!

	@IBOutlet private var scoreCounterOutlet: UILabel! {
		didSet {
			let scoreAttributedString = NSAttributedString(string: "Score: \(score)", attributes: attributes)
			scoreCounterOutlet.attributedText = scoreAttributedString
		}
	}
	@IBOutlet private var flipCounterView: UILabel! {
		didSet {
			let flipAttributedString = NSAttributedString(string: "Flips: \(flipCounter)", attributes: attributes)
			flipCounterView.attributedText = flipAttributedString
		}
	}
	
	private var emojiStringCollection = "🎃😱😈💀🧟‍♀️"
	private var emojiDict = [Card:String]()
	
	
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
//				button.titleLabel?.font = UIFont(name: "Impact", size: 40)
//				button.titleLabel?.adjustsFontSizeToFitWidth = true
				button.backgroundColor = .white
			}
			else {
				button.setTitle("", for: .normal)
				button.backgroundColor = card.isMatched ? .clear: .orange
			}
		}
	}

	private func chooseEmoji(for card: Card) -> String? {
		if emojiDict[card] == nil, emojiStringCollection.count > 0 {
			let randomStringIndex = emojiStringCollection.index(emojiStringCollection.startIndex, offsetBy: emojiStringCollection.count.arc4random)
			emojiDict[card] = String(emojiStringCollection.remove(at: randomStringIndex)) //  .remove returns the removed, passing char to String()
		}
		return String(emojiDict[card] ?? "NIL")
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
