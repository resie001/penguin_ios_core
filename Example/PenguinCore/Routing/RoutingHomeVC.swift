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
            ) { [weak self] (result: Result<Void, PenguinRouterError>) in
                guard let self = self else { return }
                PenguinRouting.shared.back()
                
                if case let .failure(error) = result {
                    self.sendNotification(
                        title: "Penguin Core Example",
                        body: error.description,
                        time: .leastNonzeroMagnitude
                    )
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
    func sendNotification(title: String, body: String, time: TimeInterval) {
        let identifier = "task-notification"
        let notificationCenter = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.badge = NSNumber(value: 3)
        content.sound = .default()
        
        let triger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: triger)
        
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
        notificationCenter.add(request) { (error) in
            if let error = error {
                debugPrint("Notification Error: ", error)
            }
        }
    }
}
