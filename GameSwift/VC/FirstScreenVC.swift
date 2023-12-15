//
//  FirstScreenVC.swift
//  GameSwift
//
//  Created by Руслан on 28.11.2023.
//

import UIKit

class FirstScreenVC: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setupConstrait()
    }

     var horizontalStackView: UIStackView = {
       var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 40
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        return stackView
    }()

    lazy var firstButton: UIButton = {
        var button = UIButton()
        button.setTitle("Цвета", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.contentHorizontalAlignment = .right
        button.addTarget(nil, action: #selector(nextGameScreen), for: .touchUpInside)
        return button
    }()

    @objc func nextGameScreen() {
        let screen = SecondGame()
        self.present(screen, animated: true, completion: nil)
    }
    
    lazy var secondButton: UIButton = {
        var button = UIButton()
        button.setTitle("Числа", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.contentHorizontalAlignment = .left
        button.addTarget(nil, action: #selector(nextScreen), for: .touchUpInside)
        return button
    }()

    @objc func nextScreen() {
        let screen = ViewController()
        self.present(screen, animated: true, completion: nil)
    }
    
    lazy var centerLabel: UILabel = {
        var label = UILabel()
        label.text = "Выбери игру"
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()




    func setupView() {
        view.addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(firstButton)
        horizontalStackView.addArrangedSubview(centerLabel)
        horizontalStackView.addArrangedSubview(secondButton)
    }


    func setupConstrait() {
        horizontalStackView.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaInsets).inset(300)
            make.bottom.top.equalTo(view.safeAreaInsets)
        }
    }




}

