//
//  RoutingParameterVC.swift
//  PenguinCore_Example
//
//  Created by Ade Resie on 22/07/24.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import UIKit
import PenguinRouting
import SnapKit

internal final class RoutingParameterVC: UIViewController, PenguinCoordinatorVCProtocol {
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
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setConstraints()
    }
}

extension RoutingParameterVC {
    private func setupUI() {
        view.backgroundColor = .white
        
        navigationItem.backButtonTitle = ""
        title = "Basic Routing with Parameter"
        
        [imgView, contentLabel].forEach { view.addSubview($0) }
        
        if let content = coordinator?.arguments?["content"] as? String? {
            contentLabel.text = content
        }
    }
    
    private func setConstraints() {
        imgView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        contentLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(imgView.snp.bottom).offset(32)
        }
    }
}
