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
	
	var indexOfOneCardFaceUp: Int? {
		get {
			var foundIndex: Int? = nil
			for index in cards.indices {
				if cards[index].isFaceUp {
					if foundIndex == nil {
						foundIndex = index
					} else {
						return nil
					}
				}
			}
			return foundIndex
		}
		set(newValue) {
			for index in cards.indices {
				cards[index].isFaceUp = (index == newValue) // all cards faceDown unless there is one (newValue) then  'index==newValue'  returns true.
			}
		}
	}
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
				
			} else {
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

