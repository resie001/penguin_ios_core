//
//  UtilitiesFontVC.swift
//  PenguinCore_Example
//
//  Created by Ade Resie on 29/07/24.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import UIKit
import SnapKit
import PenguinUtilities

internal final class UtilitiesFontVC: UIViewController {
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
    
    private let scrollView = UIScrollView()
    private let containerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setConstraints()
    }
}

extension UtilitiesFontVC {
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(stackView)
        
        title = "Penguin Utilities Font"
        navigationItem.backButtonTitle = ""
        
        [
            spacer(height: 40),
            imgView,
            spacer(height: 80),
            generateLabel(font: .systemFont(ofSize: 12), text: "Poppins-Black"),
            generateLabel(font: .black(size: 14), text: "Ade Resie Mucharobbi"),
            spacer(height: 8),
            generateLabel(font: .systemFont(ofSize: 12), text: "Poppins-BlackItalic"),
            generateLabel(font: .blackItalic(size: 14), text: "Ade Resie Mucharobbi"),
            spacer(height: 8),
            generateLabel(font: .systemFont(ofSize: 12), text: "Poppins-Bold"),
            generateLabel(font: .bold(size: 14), text: "Ade Resie Mucharobbi"),
            spacer(height: 8),
            generateLabel(font: .systemFont(ofSize: 12), text: "Poppins-BoldItalic"),
            generateLabel(font: .boldItalic(size: 14), text: "Ade Resie Mucharobbi"),
            spacer(height: 8),
            generateLabel(font: .systemFont(ofSize: 12), text: "Poppins-ExtraBold"),
            generateLabel(font: .extraBold(size: 14), text: "Ade Resie Mucharobbi"),
            spacer(height: 8),
            generateLabel(font: .systemFont(ofSize: 12), text: "Poppins-ExtraBoldItalic"),
            generateLabel(font: .extraBoldItalic(size: 14), text: "Ade Resie Mucharobbi"),
            spacer(height: 8),
            generateLabel(font: .systemFont(ofSize: 12), text: "Poppins-ExtraLight"),
            generateLabel(font: .extraLight(size: 14), text: "Ade Resie Mucharobbi"),
            spacer(height: 8),
            generateLabel(font: .systemFont(ofSize: 12), text: "Poppins-ExtraLightItalic"),
            generateLabel(font: .extraLightItalic(size: 14), text: "Ade Resie Mucharobbi"),
            spacer(height: 8),
            generateLabel(font: .systemFont(ofSize: 12), text: "Poppins-Italic"),
            generateLabel(font: .italic(size: 14), text: "Ade Resie Mucharobbi"),
            spacer(height: 8),
            generateLabel(font: .systemFont(ofSize: 12), text: "Poppins-LightItalic"),
            generateLabel(font: .lightItalic(size: 14), text: "Ade Resie Mucharobbi"),
            spacer(height: 8),
            generateLabel(font: .systemFont(ofSize: 12), text: "Poppins-Medium"),
            generateLabel(font: .medium(size: 14), text: "Ade Resie Mucharobbi"),
            spacer(height: 8),
            generateLabel(font: .systemFont(ofSize: 12), text: "Poppins-MediumItalic"),
            generateLabel(font: .mediumItalic(size: 14), text: "Ade Resie Mucharobbi"),
            spacer(height: 8),
            generateLabel(font: .systemFont(ofSize: 12), text: "Poppins-Regular"),
            generateLabel(font: .regular(size: 14), text: "Ade Resie Mucharobbi"),
            spacer(height: 8),
            generateLabel(font: .systemFont(ofSize: 12), text: "Poppins-SemiBold"),
            generateLabel(font: .semiBold(size: 14), text: "Ade Resie Mucharobbi"),
            spacer(height: 8),
            generateLabel(font: .systemFont(ofSize: 12), text: "Poppins-SemiBoldItalic"),
            generateLabel(font: .semiBoldItalic(size: 14), text: "Ade Resie Mucharobbi"),
            spacer(height: 8),
            generateLabel(font: .systemFont(ofSize: 12), text: "Poppins-Thin"),
            generateLabel(font: .thin(size: 14), text: "Ade Resie Mucharobbi"),
            spacer(height: 8),
            generateLabel(font: .systemFont(ofSize: 12), text: "Poppins-ThinItalic"),
            generateLabel(font: .thinItalic(size: 14), text: "Ade Resie Mucharobbi"),
        ].forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    private func setConstraints() {
        scrollView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func spacer(height: Float) -> UIView {
        let view = UIView()
        view.snp.makeConstraints { make in
            make.height.equalTo(height)
        }
        return view
    }
    
    private func generateLabel(font: UIFont, text: String) -> UILabel {
        let label = UILabel()
        label.font = font
        label.text = text
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }
}
