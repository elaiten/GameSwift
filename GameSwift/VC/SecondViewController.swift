//
//  SecondViewController.swift
//  GameSwift
//
//  Created by Руслан on 21.11.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setupConstrait()
    }
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Назад", for: .normal)
        button.setTitleColor(.blue.withAlphaComponent(0.6), for: .normal)
        button.addTarget(nil, action: #selector(buttonUpTouched), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonUpTouched() {
        dismiss(animated: true)
    }
    
    func setupView() {
        view.addSubview(backButton)
    }
    
    func setupConstrait() {
        backButton.snp.makeConstraints { make in
            make.top.bottom.equalTo(additionalSafeAreaInsets).inset(70)
            make.left.right.equalTo(additionalSafeAreaInsets).inset(300)
        }
    }
}
