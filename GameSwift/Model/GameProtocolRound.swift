//
//  GameProtocolRound.swift
//  GameSwift
//
//  Created by Руслан on 8.12.2023.
//

import Foundation

protocol GameRoundProtocol {
    var score: Int {get}
    var currentSecretValue: Int! {get}
    func calculateScore(with: Int)
}
