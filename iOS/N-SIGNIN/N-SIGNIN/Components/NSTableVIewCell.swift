//
//  NSTableVIewCell.swift
//  N-SIGNIN
//
//  Created by Álvaro Gutiérrez Jácome on 16/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import UIKit

final class NSTableViewCell: UITableViewCell {
    static let reuseID = "infoCell"

    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let secureField = UITextField()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupSecureField()
        self.layoutViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(content: (String, String, FieldType)) {
        self.titleLabel.adjustsFontSizeToFitWidth = true
        self.descriptionLabel.adjustsFontSizeToFitWidth = true
        self.secureField.adjustsFontSizeToFitWidth = true

        self.titleLabel.text = content.0
        self.descriptionLabel.text = content.1
        self.secureField.text = content.1

        self.titleLabel.font = .preferredFont(forTextStyle: .subheadline)
        self.titleLabel.textColor = .secondaryLabel

        self.configureSecureField(type: content.2)
    }

    private func setupSecureField() {
        self.secureField.isSecureTextEntry = true
        self.secureField.isHidden = true

        let eyeIcon = UIImageView()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.togglesSecurity))

        eyeIcon.image = UIImage(named: "Group 6")
        eyeIcon.isUserInteractionEnabled = true
        eyeIcon.addGestureRecognizer(gesture)
        eyeIcon.contentMode = .scaleAspectFit
        eyeIcon.clipsToBounds = true

        self.secureField.rightView = eyeIcon
        self.secureField.rightViewMode = .always
        self.secureField.delegate = self
    }

    @objc private func togglesSecurity() {
        self.secureField.isSecureTextEntry.toggle()
    }

    private func configureSecureField(type: FieldType) {
        switch type {
            case .Normal:
                self.descriptionLabel.isHidden = false
                self.secureField.isHidden = true

            case .Secure:
                self.secureField.isHidden = false
                self.descriptionLabel.isHidden = true
        }
    }

    private func layoutViews() {
        contentView.addSubview(self.titleLabel)
        contentView.addSubview(self.descriptionLabel)
        contentView.addSubview(self.secureField)

        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.secureField.translatesAutoresizingMaskIntoConstraints = false

        accessoryType = .none
        backgroundColor = .clear

        NSLayoutConstraint.activate([
            self.titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            self.titleLabel.widthAnchor.constraint(equalToConstant: 100),
            self.titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 40),

            self.descriptionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor, constant: 25),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            self.descriptionLabel.heightAnchor.constraint(equalToConstant: 40),

            self.secureField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            self.secureField.leadingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor, constant: 25),
            self.secureField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            self.secureField.heightAnchor.constraint(equalToConstant: 40),

            self.secureField.rightView!.widthAnchor.constraint(equalToConstant: 20),
//            self.secureField.rightView!.heightAnchor.constraint(equalToConstant: 10)

        ])
    }
}

extension NSTableViewCell: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        false
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        false
    }
}
