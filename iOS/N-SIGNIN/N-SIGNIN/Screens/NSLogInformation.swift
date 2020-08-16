//
//  NSLogInformation.swift
//  N-SIGNIN
//
//  Created by Álvaro Gutiérrez Jácome on 15/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import UIKit

final class NSLogInformation: UIViewController {
    private let usernameTextField: NSTextField
    private let passwordTextField: NSTextField
    private let usernameField: NSFormField
    private let passwordField: NSFormField

    init() {
        usernameTextField = NSTextField(iconImage: UIImage(named: "Group 3"), alternateIconImage: UIImage(named: "Group 5")).userNameMode()
        passwordTextField = NSTextField(iconImage: UIImage(named: "Group 4")).passwordMode()
        usernameField = NSFormField(textfield: usernameTextField, titleLabel: "Username")
        passwordField = NSFormField(textfield: passwordTextField, titleLabel: "Password")

        super.init(nibName: nil, bundle: nil)
        title = "Log in information"
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
        usernameTextField.tag = 0
        passwordTextField.tag = 1
        usernameTextField.delegate = parent as? UITextFieldDelegate
        passwordTextField.delegate = parent as? UITextFieldDelegate
    }

    private func addSubViews() {
        view.addSubview(usernameField)
        view.addSubview(passwordField)
    }

    private func layoutSubViews() {
        layoutNameTextField()
        layoutSurNameTextField()
    }

    private func layoutNameTextField() {
        NSLayoutConstraint.activate([
            usernameField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 183),
            usernameField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 41),
            usernameField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -41),
            usernameField.bottomAnchor.constraint(equalTo: passwordField.topAnchor, constant: -34),
        ])
    }

    private func layoutSurNameTextField() {
        NSLayoutConstraint.activate([
            passwordField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 34),
            passwordField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 41),
            passwordField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -41),
        ])
    }
}

extension NSLogInformation: NSSignUpProcessDelegate {
    func updateData(model: NSSignUpProcessViewModel) {
        model.updateLoginInformation(username: usernameTextField.text!, password: passwordTextField.text!)
    }
}
