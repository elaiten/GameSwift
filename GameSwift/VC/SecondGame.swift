//
//  SecondGame.swift
//  GameSwift
//
//  Created by Руслан on 8.12.2023.
//

import UIKit
import SnapKit

class SecondGame: UIViewController {
    
    var randomClass: SecondGameModel!
    
    lazy var randomLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = UIColor.black
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        label.widthAnchor.constraint(equalToConstant: 150).isActive = true
        label.textAlignment = .center
        return label
    }()
    
    
    lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy var firstButton: UIButton = {
        let button = UIButton()
        button.setTitle("Вариант 1", for: .normal)
        button.backgroundColor = UIColor.random
        button.setTitleColor(.black, for: .normal)
        button.addTarget(nil, action: #selector(responseFirst), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return button
    }()
    lazy var secondButton: UIButton = {
        let button = UIButton()
        button.setTitle("Вариант 2", for: .normal)
        button.backgroundColor = UIColor.random
        button.setTitleColor(.black, for: .normal)
        button.addTarget(nil, action: #selector(responseSecond), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return button
    }()
    lazy var thridButton: UIButton = {
        let button = UIButton()
        button.setTitle("Вариант 3", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor.random
        button.addTarget(nil, action: #selector(responseThree), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return button
    }()
    lazy var fourButton: UIButton = {
        let button = UIButton()
        button.setTitle("Вариант 4", for: .normal)
        button.backgroundColor = UIColor.random
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.addTarget(nil, action: #selector(responseFour), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setupConstrait()
        randomClass = SecondGameModel()
        setupButton(sendet:randomClass.getNewSecretValue(), color: randomClass.random!)
        print(randomClass.getNewSecretValue())
    }
    
    @objc func responseFirst() {
        alerts(random: randomClass.chooseColorOne, color: randomClass.random)
    }
    
    @objc func responseSecond() {
        alerts(random: randomClass.chooseColorSecond, color: randomClass.random)
    }
    
    @objc func responseThree() {
        alerts(random: randomClass.chooseColorThree, color: randomClass.random)
    }
    
    @objc func responseFour() {
        alerts(random: randomClass.chooseColorFours, color: randomClass.random)

    }
    
    func alerts(random: String, color: String) {
        if random == color {
            let alert = UIAlertController(
                title: "Игра окончена",
                message: "Вы угадали", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(
                title: "Игра окончена",
                message: "Вы не угадали", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func setupButton(sendet : Int, color: String) {
        let randomValue = sendet
        switch randomValue {
        case 1:
            randomClass.chooseColorOne = color
            firstButton.backgroundColor = UIColor.init(hexString: color)
            randomLabel.text = "\(color)"
        case 2:
            randomClass.chooseColorSecond = color
            secondButton.backgroundColor = UIColor.init(hexString: color)
            randomLabel.text = "\(color)"
        case 3:
            randomClass.chooseColorThree = color
            thridButton.backgroundColor = UIColor.init(hexString: color)
            randomLabel.text = "\(color)"
        case 4:
            randomClass.chooseColorFours = color
            fourButton.backgroundColor = UIColor.init(hexString: color)
            randomLabel.text = "\(color)"
        default:
            randomLabel.textColor = UIColor.red
        }
    }
    
    func setupView() {
        view.addSubview(horizontalStackView)
        view.addSubview(randomLabel)
        horizontalStackView.addArrangedSubview(firstButton)
        horizontalStackView.addArrangedSubview(secondButton)
        horizontalStackView.addArrangedSubview(thridButton)
        horizontalStackView.addArrangedSubview(fourButton)
    }
    
    func setupConstrait() {
        randomLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(50)
            make.centerX.equalTo(horizontalStackView)
        }
        horizontalStackView.snp.makeConstraints { make in
            make.left.right.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(50)
        }
    }
}
