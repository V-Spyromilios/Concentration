//
//  concentration.swift
//  Concentration
//
//  Created by Evangelos Spyromilios on 05.12.22.
//

import Foundation

struct Concentration
{
	private(set) var cards = [Card]()
	
	private var indexOfOneCardFaceUp: Int? {
		get { return
			cards.indices.filter { cards[$0].isFaceUp }.oneAndOnlyOne
			// filter the indices based on the closure and then return type 'Element?'
		}
		
		set(newValue) {
			for index in cards.indices {
				cards[index].isFaceUp = (index == newValue) // all cards faceDown unless there is one (newValue) then isFaceUp =   'index==newValue' which  returns true.
			}
		}
	}
	
	mutating func chooseCard(at index: Int) {
		assert(cards.indices.contains(index), "ASSERT: Concentration.chooseCard() - called with \(index)")
		
		if !cards[index].isMatched {
			if let matchIndex = indexOfOneCardFaceUp, matchIndex != index {
				// check if they match
				if cards[matchIndex] == cards[index] {  // Can compare Card(s) directly as they conform to Equatable
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
		assert(numberOfPairsOfCards > 0, "ASSERT: Concertation.init() - called with \(numberOfPairsOfCards)")
		
		let counter = numberOfPairsOfCards - 1
		for _ in 0...counter {
			let card = Card()
			cards.append(card)
			cards.append(card)
		}
		cards.shuffle()
	}
}


extension Collection {
	var oneAndOnlyOne: Element? {
		return count == 1 ? first: nil
	}
}
