//
//  Card.swift
//  Concentration
//
//  Created by Evangelos Spyromilios on 05.12.22.
//

import Foundation

struct Card: Hashable
{
	
	var isFaceUp = false
	var isMatched = false
	private var identifier: Int

	private static var Identifier = 0

	private static func getUniqueIdentifier() -> Int {
		Identifier += 1
		return Identifier
	}
	
	func getIdentifier()-> Int {
		return self.identifier
	}
	
	/// explicit implemetation of == and hashValue is not required in this version of Swift!
	static func ==(lhs:Card, rhs: Card)-> Bool {
		return lhs.identifier == rhs.identifier
	}

	init() {
		self.identifier = Card.getUniqueIdentifier()
	}
}

