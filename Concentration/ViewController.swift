//
//  ViewController.swift
//  Concentration
//
//  Created by Evangelos Spyromilios on 05.12.22.
//

import UIKit

class ViewController: UIViewController {

let game = Concentration(numberOfPairsOfCards: 5)

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

let emojiArray = ["📱", "👻", "💣", "😎", "🎉","📱", "👻", "💣", "😎", "🎉"]
var lastPressedButton: UIButton? = nil


@IBAction func pressButton(_ sender: UIButton) {
	flipCounter += 1
	if flipCounter == buttonsArray.count {
		print("GAME OVER!")
		// TODO: - Add Game Over View
	}
	if let cardNumber = buttonsArray.firstIndex(of: sender) {
		let emoji = emojiArray[cardNumber]
		flipCard(withEmoji: emoji, on: sender)
	} else {
		print("ERROR: Card not found on Buttons Array")
	}
	
	if lastPressedButton?.currentTitle == sender.currentTitle {
		score += 1
	}

	lastPressedButton = sender
}


func flipCard(withEmoji emoji: String, on button: UIButton) {
	
	if button.currentTitle == emoji {
		hideCard(card: button)
	}
	else {
		revealCard(show: emoji, card: button)
	}
}
}

func hideCard(card: UIButton) {
	card.setTitle("", for: .normal)
	card.backgroundColor = .orange
}

func revealCard(show emoji: String, card: UIButton) {
	card.setTitle(emoji, for: .normal)
	card.backgroundColor = .white
}
//	func setEmojis(with emojiArray: [String], to buttons: [UIButton]) {
//		var emojiLen = emojiArray.count - 1
//		var buttonIndex = buttons.count - 1
//
//		while emojiLen >= 0 && buttonIndex >= 0 {
//			buttons[buttonIndex].setTitle(emojiArray[emojiLen], for: .normal)
//			buttonIndex -= 1
//			emojiLen -= 1
//			if buttonIndex < 0 { break }
//			else if emojiLen < 0 {
//				emojiLen = emojiArray.count
//			}
//		}
//	}
//}
//	override func viewDidLoad() {
//		super.viewDidLoad()
//		setEmojis(with: emojiArray, to: buttonsArray)
//	}
//}
