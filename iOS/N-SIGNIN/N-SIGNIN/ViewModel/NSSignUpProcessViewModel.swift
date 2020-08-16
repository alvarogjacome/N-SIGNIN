//
//  NSSignUpProcessViewModel.swift
//  N-SIGNIN
//
//  Created by Álvaro Gutiérrez Jácome on 16/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import Foundation

enum FieldType {
    case Normal
    case Secure
}

final class NSSignUpProcessViewModel {
    private var model: SignUpModel

    init() {
        self.model = SignUpModel()
    }

    func updatePersonalInfo(name: String, surname: String) {
        model.updateName(name.emptyString())
        model.updateSurname(surname.emptyString())
    }

    func updateGenderAndBirth(gender: String, birth: String) {
        model.updateGender(gender.emptyString())
        model.updateBirth(birth.emptyString())
    }

    func updateLoginInformation(username: String, password: String) {
        model.updateUserName(username.emptyString())
        model.updatePassword(password.emptyString())
    }

    func getModelElements() -> [(String, String, FieldType)] {
        [("Name", model.getName(), .Normal),
         ("Surname", model.getSurname(), .Normal),
         ("Gender", model.getGender(), .Normal),
         ("Birth", model.getBirth(), .Normal),
         ("Username", model.getUserName(), .Normal),
         ("Password", model.getPassword(), .Secure)]
    }
}

struct SignUpModel {
    private var name: String?
    private var surname: String?
    private var userName: String?
    private var password: String?
    private var gender: String?
    private var birth: String?

    private let emptyField = "---"

    mutating func updateName(_ name: String?) {
        self.name = name
    }

    mutating func updateSurname(_ surname: String?) {
        self.surname = surname
    }

    mutating func updateUserName(_ userName: String?) {
        self.userName = userName
    }

    mutating func updatePassword(_ password: String?) {
        self.password = password
    }

    mutating func updateGender(_ gender: String?) {
        self.gender = gender
    }

    mutating func updateBirth(_ birth: String?) {
        self.birth = birth
    }

    func getName() -> String {
        name ?? emptyField
    }

    func getSurname() -> String {
        surname ?? emptyField
    }

    func getUserName() -> String {
        userName ?? emptyField
    }

    func getPassword() -> String {
        password ?? emptyField
    }

    func getGender() -> String {
        gender ?? emptyField
    }

    func getBirth() -> String {
        birth ?? emptyField
    }
}
