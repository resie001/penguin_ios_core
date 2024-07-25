//
//  RoutingBasicVC.swift
//  PenguinCore_Example
//
//  Created by Ade Resie on 22/07/24.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import UIKit
import SnapKit

internal final class RoutingBasicVC: UIViewController {
    private let imgView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { make in
            make.height.equalTo(200)
        }
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setConstraints()
    }
}

extension RoutingBasicVC {
    private func setupUI() {
        view.backgroundColor = .white
        
        navigationItem.backButtonTitle = ""
        title = "Basic Routing"
        
        view.addSubview(imgView)
    }
    
    private func setConstraints() {
        imgView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
