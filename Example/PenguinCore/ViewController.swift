//
//  ViewController.swift
//  PenguinCore
//
//  Created by Ade Resie on 07/22/2024.
//  Copyright (c) 2024 Ade Resie. All rights reserved.
//

import UIKit
import SnapKit
import PenguinRouting

internal final class ViewController: UIViewController {
    private let imgView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { make in
            make.height.equalTo(200)
        }
        return imageView
    }()
    
    private lazy var routingButton: UIButton = {
        let button = builderButton(title: "Routing")
        button.addTarget(self, action: #selector(routingTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func routingTapped() {
        PenguinRouting
            .shared
            .route(
                name: GlobalPath.routing.description,
                path: RoutingPath.home.description
        )
    }
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 0
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setConstraints()
        setSpacing()
    }

}

extension ViewController {
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        
        navigationItem.backButtonTitle = ""
        title = "Example Penguin Core"
        
        [
            spacer(height: 40),
            imgView,
            UIView(),
            routingButton,
        ].forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    private func setConstraints() {
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-40)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }
    
    private func setSpacing() {
        
    }
    
    private func builderButton(title: String) -> UIButton {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.contentEdgeInsets = .zero
        button.titleEdgeInsets = .zero
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.setTitleColor(.white, for: .normal)
        button.setTitle(title, for: .normal)
        button.snp.makeConstraints { make in
            make.height.equalTo(44)
        }
        return button
    }
    
    private func spacer(height: Float) -> UIView {
        let view = UIView()
        view.snp.makeConstraints { make in
            make.height.equalTo(height)
        }
        return view
    }
}

