//
//  Card.swift
//  Concentration
//
//  Created by Evangelos Spyromilios on 05.12.22.
//

import Foundation

struct Card {
	var isFaceUp = false
	var isMatched = false
	var identifier: Int

	static var Identifier = 0

	static func getUniqueIdentifier() -> Int {
		Identifier += 1
		return Identifier
	}

	init() {
		self.identifier = Card.getUniqueIdentifier()
	}
}
