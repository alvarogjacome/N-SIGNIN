//
//  NSSignUpProcessViewModel.swift
//  N-SIGNIN
//
//  Created by Álvaro Gutiérrez Jácome on 16/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import Foundation

final class NSSignUpProcessViewModel {
    private var model: SignUpModel

    init() {
        self.model = SignUpModel()
    }

    func updatePersonalInfo(name: String, surname: String) {
        model.updateName(name)
        model.updateSurname(surname)
    }

    func updateGenderAndBirth(gender: String, birth: String) {
        model.updateGender(gender)
        model.updateBirth(birth)
    }

    func updateLoginInformation(username: String, password: String) {
        model.updateUserName(username)
        model.updatePassword(password)

        dump(model)
    }
}

struct SignUpModel {
    private var name: String?
    private var surname: String?
    private var userName: String?
    private var password: String?
    private var gender: String?
    private var birth: String?

    mutating func updateName(_ name: String) {
        self.name = name
    }

    mutating func updateSurname(_ surname: String) {
        self.surname = surname
    }

    mutating func updateUserName(_ userName: String) {
        self.userName = userName
    }

    mutating func updatePassword(_ password: String) {
        self.password = password
    }

    mutating func updateGender(_ gender: String) {
        self.gender = gender
    }

    mutating func updateBirth(_ birth: String) {
        self.birth = birth
    }
}
