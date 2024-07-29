//
//  RoutingCustomCompletionVC.swift
//  PenguinCore_Example
//
//  Created by Ade Resie on 25/07/24.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import UIKit
import SnapKit
import PenguinRouting

internal final class RoutingCustomCompletionVC: UIViewController, PenguinCoordinatorVCProtocol {
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
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 0
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var completionStringButton: UIButton = {
        let button = builderButton(title: "String Completion")
        button.addTarget(self, action: #selector(completionStringTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func completionStringTapped() {
        PenguinRouting
            .shared
            .route(
                name: GlobalPath.routing.description,
                path: RoutingPath.stringCompletion.description
            ) { [weak self] (result: (Result<String, PenguinRouterError>)) in
                guard let self = self else { return }
                
                PenguinRouting.shared.back()
                
                if case let .success(data) = result {
                    self.sendNotification(
                        title: "Penguin Core Example",
                        body: "Result String is \(data)",
                        time: .leastNonzeroMagnitude
                    )
                }
                
                if case let .failure(error) = result {
                    self.sendNotification(
                        title: "Penguin Core Example",
                        body: error.description,
                        time: .leastNonzeroMagnitude
                    )
                }
            }
    }
    
    private lazy var completionIntButton: UIButton = {
        let button = builderButton(title: "Int Completion")
        button.addTarget(self, action: #selector(completionIntTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func completionIntTapped() {
        PenguinRouting
            .shared
            .route(
                name: GlobalPath.routing.description,
                path: RoutingPath.intCompletion.description
            ) { [weak self] (result: (Result<Int, PenguinRouterError>)) in
                guard let self = self else { return }
                
                PenguinRouting.shared.back()
                
                if case let .success(data) = result {
                    self.sendNotification(
                        title: "Penguin Core Example",
                        body: "Result randomizer Int is \(data)",
                        time: .leastNonzeroMagnitude
                    )
                }
                
                if case let .failure(error) = result {
                    self.sendNotification(
                        title: "Penguin Core Example",
                        body: error.description,
                        time: .leastNonzeroMagnitude
                    )
                }
            }
    }
    
    private lazy var completionFloatButton: UIButton = {
        let button = builderButton(title: "Float Completion")
        button.addTarget(self, action: #selector(completionFloatTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func completionFloatTapped() {
        PenguinRouting
            .shared
            .route(
                name: GlobalPath.routing.description,
                path: RoutingPath.floatCompletion.description
            ) { [weak self] (result: (Result<Float, PenguinRouterError>)) in
                guard let self = self else { return }
                
                PenguinRouting.shared.back()
                
                if case let .success(data) = result {
                    self.sendNotification(
                        title: "Penguin Core Example",
                        body: "Result randomizer Float is \(data)",
                        time: .leastNonzeroMagnitude
                    )
                }
                
                if case let .failure(error) = result {
                    self.sendNotification(
                        title: "Penguin Core Example",
                        body: error.description,
                        time: .leastNonzeroMagnitude
                    )
                }
            }
    }
    
    private lazy var completionBoolButton: UIButton = {
        let button = builderButton(title: "Bool Completion")
        button.addTarget(self, action: #selector(completionBoolTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func completionBoolTapped() {
        PenguinRouting
            .shared
            .route(
                name: GlobalPath.routing.description,
                path: RoutingPath.boolCompletion.description
            ) { [weak self] (result: (Result<Bool, PenguinRouterError>)) in
                guard let self = self else { return }
                
                PenguinRouting.shared.back()
                
                if case let .success(data) = result {
                    self.sendNotification(
                        title: "Penguin Core Example",
                        body: "Result randomizer Bool is \(data)",
                        time: .leastNonzeroMagnitude
                    )
                }
                
                if case let .failure(error) = result {
                    self.sendNotification(
                        title: "Penguin Core Example",
                        body: error.description,
                        time: .leastNonzeroMagnitude
                    )
                }
            }
    }
    
    private lazy var completionDictButton: UIButton = {
        let button = builderButton(title: "Dict Completion")
        button.addTarget(self, action: #selector(completionDictTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func completionDictTapped() {
        PenguinRouting
            .shared
            .route(
                name: GlobalPath.routing.description,
                path: RoutingPath.dictCompletion.description
            ) { [weak self] (result: (Result<Dictionary, PenguinRouterError>)) in
                guard let self = self else { return }
                
                PenguinRouting.shared.back()
                
                if case let .success(data) = result {
                    self.sendNotification(
                        title: "Penguin Core Example",
                        body: "Result Dict is \(data)",
                        time: .leastNonzeroMagnitude
                    )
                }
                
                if case let .failure(error) = result {
                    self.sendNotification(
                        title: "Penguin Core Example",
                        body: error.description,
                        time: .leastNonzeroMagnitude
                    )
                }
            }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setSpacing()
        setConstraints()
    }
}

extension RoutingCustomCompletionVC {
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        
        title = "Custom Completion Routing"
        navigationItem.backButtonTitle = ""
        
        [
            spacer(height: 40),
            imgView,
            UIView(),
            completionStringButton,
            completionIntButton,
            completionBoolButton,
            completionFloatButton,
            completionDictButton
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
        stackView.setCustomSpacing(16, after: completionStringButton)
        stackView.setCustomSpacing(16, after: completionIntButton)
        stackView.setCustomSpacing(16, after: completionBoolButton)
        stackView.setCustomSpacing(16, after: completionFloatButton)
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
