//
//  GameProtocol.swift
//  GameSwift
//
//  Created by Руслан on 8.12.2023.
//

import Foundation

protocol GameProtocol {
    var isGameEnded: Bool {get}
    func restartGame()
    func startNewRound()
}
