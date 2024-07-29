//
//  CustomRoutingDictVC.swift
//  PenguinCore_Example
//
//  Created by Ade Resie on 29/07/24.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import UIKit
import PenguinRouting
import SnapKit

internal final class CustomRoutingDictVC: UIViewController, PenguinCoordinatorVCProtocol {
    typealias Coordinator = RoutingCoordinator
    var coordinator: RoutingCoordinator?
    
    private let imgView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { make in
            make.height.equalTo(200)
        }
        return imageView
    }()
    
    private lazy var successButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.contentEdgeInsets = .zero
        button.titleEdgeInsets = .zero
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Success", for: .normal)
        button.snp.makeConstraints { make in
            make.height.equalTo(44)
        }
        button.addTarget(self, action: #selector(successTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func successTapped() {
        var dict: [String: Any] = [
            "name": "Ade Resie",
            "age": 24
        ]
        coordinator?.completion?(.success((dict.toData())))
    }
    
    private lazy var failureButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.contentEdgeInsets = .zero
        button.titleEdgeInsets = .zero
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Failure", for: .normal)
        button.snp.makeConstraints { make in
            make.height.equalTo(44)
        }
        button.addTarget(self, action: #selector(failureTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func failureTapped() {
        coordinator?.completion?(.failure(.emptyFailure))
    }
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.axis = .horizontal
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setConstraints()
    }
}

extension CustomRoutingDictVC {
    private func setupUI() {
        view.backgroundColor = .white
        
        navigationItem.backButtonTitle = ""
        title = "Dict Completion Routing"
        
        [imgView, stackView].forEach { view.addSubview($0) }
        [successButton, failureButton].forEach { stackView.addArrangedSubview($0) }
    }
    
    private func setConstraints() {
        imgView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(imgView.snp.bottom).offset(40)
        }
    }
}

