//
//  NSFormField.swift
//  N-SIGNIN
//
//  Created by Álvaro Gutiérrez Jácome on 15/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import UIKit

final class NSFormField: UIView {
    private let textfield: NSTextField
    private let label: UILabel = UILabel()

    init(textfield: NSTextField, titleLabel: String) {
        self.textfield = textfield
        label.text = titleLabel
        label.textColor = .secondaryLabel
        super.init(frame: .zero)

        translatesAutoresizingMaskIntoConstraints = false

        addViews()
        layoutViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addViews() {
        addSubview(textfield)
        addSubview(label)
    }

    private func layoutViews() {
        layoutLabel()
        layoutTextField()
    }

    private func layoutLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.bottomAnchor.constraint(equalTo: textfield.topAnchor, constant: -10)
        ])
    }

    private func layoutTextField() {
        NSLayoutConstraint.activate([
            textfield.heightAnchor.constraint(equalToConstant: 54),
            textfield.leadingAnchor.constraint(equalTo: leadingAnchor),
            textfield.trailingAnchor.constraint(equalTo: trailingAnchor),
            textfield.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
