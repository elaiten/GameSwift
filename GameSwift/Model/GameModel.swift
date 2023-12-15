//
//  GameModel.swift
//  GameSwift
//
//  Created by Руслан on 21.11.2023.
//

import Foundation


class Game: GameProtocol, GameRoundProtocol, GeneratorProtocol {
    
    
    var currentSecretValue: Int! = 0
    var score: Int = 0
    // Минимальное загаданное значение
    var minSecretValue: Int
    // Максимальное загаданное значение
    var maxSecretValue: Int
    // Количество раундов
    var lastRound: Int
    var currentRound: Int = 0
    var isGameEnded: Bool {
        if currentRound >= lastRound {
            return true
        } else {
            return false
        }
        
    }
    
    init?(startValue: Int, endValue: Int, rounds: Int) {
        guard startValue <= endValue else { return nil }
        minSecretValue = startValue
        maxSecretValue = endValue
        lastRound = rounds
        currentSecretValue = getNewSecretValue()
    }
    
    func restartGame() {
        currentRound = 0
        score = 0
        startNewRound()
    }
    
    func startNewRound() {
        currentSecretValue = self.getNewSecretValue()
        currentRound += 1
    }
    
    func getNewSecretValue() -> Int {
        (minSecretValue...maxSecretValue).randomElement()!
        
    }
    
     func calculateScore(with value: Int) {
        if value > currentSecretValue {
            score += 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            score += 50 - currentSecretValue + value
        } else {
            score += 50
        }
        
        
    }
    
    
}


