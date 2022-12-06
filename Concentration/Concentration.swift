//
//  concentration.swift
//  Concentration
//
//  Created by Evangelos Spyromilios on 05.12.22.
//

import Foundation

class Concentration
{
	var cards = [Card]()
	
	var indexOfOneCardFaceUp: Int?
	var randomArray = [Int]()

	func chooseCard(at index: Int) {
		if !cards[index].isMatched {
			if let matchIndex = indexOfOneCardFaceUp, matchIndex != index {
				// check if they match
				if cards[matchIndex].identifier == cards[index].identifier {
					cards[matchIndex].isMatched = true
					cards[index].isMatched = true
				}
				cards[index].isFaceUp = true
				indexOfOneCardFaceUp = nil
			} else {
				//no cards match or 2 cards are faceUp
				for index in cards.indices {
					cards[index].isFaceUp = false
				}
				cards[index].isFaceUp = true
				indexOfOneCardFaceUp = index
			}
		}
	}

	init(numberOfPairsOfCards: Int) {
		let counter = numberOfPairsOfCards - 1
		for _ in 0...counter {
			let card = Card()
			cards.append(card)
			cards.append(card)
			}
		cards.shuffle()
	}
}

