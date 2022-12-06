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

	//TODO: - shuffleTheCards() !
	init(numberOfPairsOfCards: Int) {
		for _ in 0..<numberOfPairsOfCards {
			let card = Card()
			cards.append(card)
			cards.append(card) // 	As  struct  is Copy Type.
		}
	}
}
