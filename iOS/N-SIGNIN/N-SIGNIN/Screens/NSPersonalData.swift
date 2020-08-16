//
//  NSPersonalData.swift
//  N-SIGNIN
//
//  Created by Álvaro Gutiérrez Jácome on 15/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import UIKit

final class NSPersonalData: UIViewController {
    private let nameTextField: NSTextField
    private let surnameTextField: NSTextField
    private let nameField: NSFormField
    private let surnameField: NSFormField

    init() {
        nameTextField = NSTextField(iconImage: UIImage(named: "Group 7")).nameMode()
        surnameTextField = NSTextField(iconImage: UIImage(named: "Group 7")).surnameMode()
        nameField = NSFormField(textfield: nameTextField, titleLabel: "Name")
        surnameField = NSFormField(textfield: surnameTextField, titleLabel: "Surname")

        super.init(nibName: nil, bundle: nil)

        title = "Personal data"
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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let parent = parent as? NSSignUpProcess else { return }
        parent.signUpProcessDelegate = self
    }

    private func setupView() {
        view.backgroundColor = UIColor(named: "ColdMorning")
        nameTextField.tag = 0
        surnameTextField.tag = 1
        nameTextField.delegate = parent as? UITextFieldDelegate
        surnameTextField.delegate = parent as? UITextFieldDelegate
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

extension NSPersonalData: NSSignUpProcessDelegate {
    func updateData(model: NSSignUpProcessViewModel) {
        model.updatePersonalInfo(name: nameTextField.text!, surname: surnameTextField.text!)
    }
}
