//
//  UtilitiesHomeVC.swift
//  PenguinCore_Example
//
//  Created by Ade Resie on 29/07/24.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import UIKit
import SnapKit
import PenguinRouting

internal final class UtilitiesHomeVC: UIViewController {
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
    
    private lazy var fontButton: UIButton = {
        let button = builderButton(title: "Font")
        button.addTarget(self, action: #selector(fontTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func fontTapped() {
        PenguinRouting
            .shared
            .route(
                name: GlobalPath.utilities.description,
                path: UtilitiesPath.font.description
            )
    }
    
    private lazy var colorButton: UIButton = {
        let button = builderButton(title: "Color")
        button.addTarget(self, action: #selector(colorTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func colorTapped() {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setContraints()
        setSpacing()
    }
}

extension UtilitiesHomeVC {
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        
        title = "Example Penguin Core Utilities"
        navigationItem.backButtonTitle = ""
        
        [
            spacer(height: 40),
            imgView,
            UIView(),
            fontButton,
            colorButton
        ].forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    private func setContraints() {
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-40)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }
    
    private func setSpacing() {
        stackView.setCustomSpacing(24, after: fontButton)
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
