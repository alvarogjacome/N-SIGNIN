//
//  NSGenderBirth.swift
//  N-SIGNIN
//
//  Created by Álvaro Gutiérrez Jácome on 15/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import UIKit

final class NSGenderBirth: UIViewController {
    private let genderSelector: NSTextField
    private let birthdatePicker: NSTextField
    private let nameField: NSFormField
    private let surnameField: NSFormField

    init() {
        genderSelector = NSTextField(iconImage: UIImage(named: "Vector-3"))
        birthdatePicker = NSTextField(iconImage: UIImage(named: "Group 1"))
        nameField = NSFormField(textfield: genderSelector, titleLabel: "Gender")
        surnameField = NSFormField(textfield: birthdatePicker, titleLabel: "Birthdate")

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addSubViews()
        layoutSubViews()
    }

    private func setupView() {
        view.backgroundColor = UIColor(named: "ColdMorning")
    }

    private func addSubViews() {
        view.addSubview(nameField)
        view.addSubview(surnameField)
    }

    private func layoutSubViews() {
        layoutNameTextField()
        layoutSurNameTextField()
    }

    private func layoutNameTextField() {
        NSLayoutConstraint.activate([
            nameField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 183),
            nameField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 41),
            nameField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -41),
            nameField.bottomAnchor.constraint(equalTo: surnameField.topAnchor, constant: -34),
        ])
    }

    private func layoutSurNameTextField() {
        NSLayoutConstraint.activate([
            surnameField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 34),
            surnameField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 41),
            surnameField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -41),
        ])
    }
}
