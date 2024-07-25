//
//  RoutingHomeVC.swift
//  PenguinCore_Example
//
//  Created by Ade Resie on 22/07/24.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import UIKit
import SnapKit
import PenguinRouting

internal final class RoutingHomeVC: UIViewController {
    private let imgView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { make in
            make.height.equalTo(200)
        }
        return imageView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 0
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var basicButton: UIButton = {
        let button = builderButton(title: "Basic")
        button.addTarget(self, action: #selector(basicTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func basicTapped() {
        PenguinRouting
            .shared
            .route(
                name: GlobalPath.routing.description,
                path: RoutingPath.basic.description
            )
    }
    
    private lazy var parameterButton: UIButton = {
        let button = builderButton(title: "With Parameter")
        button.addTarget(self, action: #selector(parameterTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func parameterTapped() {
        PenguinRouting
            .shared
            .route(
                name: GlobalPath.routing.description,
                path: RoutingPath.withParameter.description,
                arguments: [
                    "content": "This is example routing with argument"
                ]
            )
    }
    
    private lazy var basicCompletionButton: UIButton = {
        let button = builderButton(title: "With Basic Completion")
        button.addTarget(self, action: #selector(basicCompletionTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func basicCompletionTapped() {
        PenguinRouting
            .shared
            .route(
                name: GlobalPath.routing.description,
                path: RoutingPath.withBasicCompletion.description
            ) { [weak self] result in
                guard let self = self else { return }
                PenguinRouting.shared.back()
                
                if case let .failure(error) = result {
                    self.showToast(message: error.description)
                }
            }
    }
    
    private lazy var customCompletionButton: UIButton = {
        let button = builderButton(title: "With Custom Completion")
        button.addTarget(self, action: #selector(customCompletionTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func customCompletionTapped() {
        PenguinRouting
            .shared
            .route(
                name: GlobalPath.routing.description,
                path: RoutingPath.withCustomCompletion.description
            )
    }
    
    private lazy var objectCompletionButton: UIButton = {
        let button = builderButton(title: "With Object Completion")
        button.addTarget(self, action: #selector(customCompletionTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func objectCompletionTapped() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setConstraints()
        setSpacing()
    }
}

extension RoutingHomeVC {
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        
        title = "Example Penguin Core Routing"
        navigationItem.backButtonTitle = ""
        
        [
            spacer(height: 40),
            imgView,
            UIView(),
            basicButton,
            parameterButton,
            basicCompletionButton,
            customCompletionButton,
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
        stackView.setCustomSpacing(16, after: basicButton)
        stackView.setCustomSpacing(16, after: parameterButton)
        stackView.setCustomSpacing(16, after: basicCompletionButton)
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

internal extension UIViewController {
    func showToast(message: String, font: UIFont = .systemFont(ofSize: 14.0)) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75,
                                               y: self.view.frame.size.height - 100,
                                               width: 150,
                                               height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 5.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: { (isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
