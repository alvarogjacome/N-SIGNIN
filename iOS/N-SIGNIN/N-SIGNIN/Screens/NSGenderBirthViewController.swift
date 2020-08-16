//
//  NSGenderBirthViewController.swift
//  N-SIGNIN
//
//  Created by Álvaro Gutiérrez Jácome on 15/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import UIKit

final class NSGenderBirthViewController: UIViewController {
    private let genderSelector: NSTextField
    private let birthdatePicker: NSTextField
    private let nameField: NSFormField
    private let surnameField: NSFormField
    private let pickerData = ["Male", "Female", "Undefined"]

    init() {
        genderSelector = NSTextField(iconImage: UIImage(named: "Vector"), alternateIconImage: UIImage(named: "Vector-1")).pickerMode()
        birthdatePicker = NSTextField(iconImage: UIImage(named: "Group 1")).dateMode()
        nameField = NSFormField(textfield: genderSelector, titleLabel: "Gender")
        surnameField = NSFormField(textfield: birthdatePicker, titleLabel: "Birthdate")

        super.init(nibName: nil, bundle: nil)

        title = "Personal data: gender & age"
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
        guard let parent = parent as? NSSignUpProcessPageViewController else { return }
        parent.signUpProcessDelegate = self
    }

    private func setupView() {
        view.backgroundColor = UIColor(named: "ColdMorning")
        genderSelector.tag = 0
        birthdatePicker.tag = 1
        genderSelector.delegate = parent as? UITextFieldDelegate
        birthdatePicker.delegate = parent as? UITextFieldDelegate

        genderSelector.pickerDelegate = self
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

extension NSGenderBirthViewController: NSTextFieldPickerDelegate {
    func numberOfRows() -> Int {
        pickerData.count
    }

    func titleForRow(row: Int) -> String? {
        pickerData[row]
    }

    func didSelectRow(row: Int) -> String? {
        pickerData[row]
    }
}

extension NSGenderBirthViewController: NSSignUpProcessDelegate {
    func updateData(model: NSSignUpProcessViewModel) {
        model.updateGenderAndBirth(gender: genderSelector.text!, birth: birthdatePicker.text!)
    }
}
