//
//  ViewController.swift
//  Concentration
//
//  Created by Evangelos Spyromilios on 05.12.22.
//

import UIKit

class ViewController: UIViewController {
	
	var flipCounter = 0 {
		didSet {
			flipCounterView.text = "Flips: \(flipCounter)"
		}
	}
	
	@IBOutlet var buttonsArray: [UIButton]!
	@IBOutlet var flipCounterView: UILabel!
	let emojiArray = ["📱", "👻", "💣", "😎", "🎉","📱", "👻", "💣", "😎", "🎉"]
	
	
	
	@IBAction func pressButton(_ sender: UIButton) {
		flipCounter += 1
		if let cardNumber = buttonsArray.firstIndex(of: sender) {
			let emoji = emojiArray[cardNumber]
			flipCard(withEmoji: emoji, on: sender)
		} else {
			let emoji = emojiArray[0]
			flipCard(withEmoji: emoji, on: sender)
		}
	}
	
	
	func flipCard(withEmoji emoji: String, on button: UIButton) {
		if button.currentTitle == emoji {
			button.setTitle("", for: .normal)
			button.backgroundColor = .orange
		}
		else {
			button.setTitle(emoji, for: .normal)
			button.backgroundColor = .white
		}
	}
	
	func setEmojis(with emojiArray: [String], to buttons: [UIButton]) {
		var emojiLen = emojiArray.count - 1
		var buttonIndex = buttons.count - 1
		
		while emojiLen >= 0 && buttonIndex >= 0 {
			buttons[buttonIndex].setTitle(emojiArray[emojiLen], for: .normal)
			buttonIndex -= 1
			emojiLen -= 1
			if buttonIndex < 0 { break }
			else if emojiLen < 0 {
				emojiLen = emojiArray.count
			}
		}
	}
}
	
//	override func viewDidLoad() {
//		super.viewDidLoad()
//		setEmojis(with: emojiArray, to: buttonsArray)
//	}
//}
