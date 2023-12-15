//
//  ViewController.swift
//  GameSwift
//
//  Created by Руслан on 21.11.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var scoreAllRounds = 0
    var game: Game!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstrait()
        game = Game(startValue: 1, endValue: 100, rounds: 5)
        
        slideGame.maximumValue = Float(game.maxSecretValue)
        slideGame.minimumValue = Float(game.minSecretValue)
        slideGame.value = Float(game.maxSecretValue / 2)
        leftLabel.text = String(game.minSecretValue)
        rightLabel.text = String(game.maxSecretValue)
        view.backgroundColor = .orange
    }
    
    let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .fillEqually
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        return stackView
    }()
    
    
    lazy var rightLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.text = "Score"
        label.textColor = UIColor.white
        return label
    }()
    
    lazy var leftLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor.white
        label.text = "Score"
        return label
    }()
    
    lazy var slideGame: UISlider = {
        let slide = UISlider()
        return slide
    }()
    
    lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Score"
        label.textColor = UIColor.white
        label.textAlignment = .center
        return label
    }()
    
    lazy var infoButton: UIButton = {
        let button = UIButton()
        button.setTitle("О приложении", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(.blue.withAlphaComponent(0.8), for: .normal)
        button.addTarget(nil, action: #selector(infoButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonSegue: UIButton = {
        let button = UIButton()
        button.setTitle("Проверить", for: .normal)
        button.addTarget(nil, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func infoButtonTapped () {
        let viewController = SecondViewController()
        self.present(viewController, animated: true, completion: nil)
    }
    
    @objc func buttonTapped () {
        game.calculateScore(with: Int(slideGame.value.rounded()))
        if game.isGameEnded {
            let alert = UIAlertController(
                title: "Игра окончена",
                message: "Вы заработали \(self.scoreAllRounds) очков", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            DispatchQueue.main.async {
                self.scoreAllRounds = 0
            }
            game.restartGame()
        } else {
            game.startNewRound()
            scoreAllRounds += game.score
            scoreLabel.text =  String(game.currentSecretValue)
            
        }
    }
}




extension ViewController {
    func setupView() {
        view.addSubview(horizontalStackView)
        view.addSubview(verticalStackView)
        view.addSubview(infoButton)
        view.addSubview(leftLabel)
        view.addSubview(rightLabel)
        verticalStackView.addArrangedSubview(slideGame)
        verticalStackView.addArrangedSubview(buttonSegue)
        verticalStackView.addArrangedSubview(scoreLabel)
        
    }
    
    func setupConstrait() {
        leftLabel.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(verticalStackView.snp.top)
        }
        rightLabel.snp.makeConstraints { make in
            make.right.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(verticalStackView.snp.top)
        }
        verticalStackView.snp.makeConstraints { make in
            make.left.right.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-60)
        }
        infoButton.snp.makeConstraints { make in
            make.right.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
}


