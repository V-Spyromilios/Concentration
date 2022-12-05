//
//  concentration.swift
//  Concentration
//
//  Created by Evangelos Spyromilios on 05.12.22.
//

import Foundation

class Concentration {
	var cards = [Card]()

	func chooseCard(at Index: Int) {
		
	}

	init(numberOfPairsOfCards: Int) {
		for _ in 0..<numberOfPairsOfCards {
			let card = Card()
			cards.append(card)
			cards.append(card) // 	As  struct  is Copy Type.
		}
	}
}
