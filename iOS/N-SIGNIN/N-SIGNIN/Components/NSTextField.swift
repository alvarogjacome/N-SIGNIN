//
//  NSTextField.swift
//  N-SIGNIN
//
//  Created by Álvaro Gutiérrez Jácome on 15/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import UIKit

class NSTextField: UITextField {
    private let mainIcon: UIImage?
    private let alternateIcon: UIImage?
    private let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    var pickerDelegate: NSTextFieldPickerDelegate?

    init(iconImage: UIImage? = nil, alternateIconImage: UIImage? = nil) {
        self.mainIcon = iconImage
        self.alternateIcon = alternateIconImage
        super.init(frame: .zero)

        configuration()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configuration() {
        translatesAutoresizingMaskIntoConstraints = false

        layer.cornerRadius = 3
        layer.borderWidth = 1
        layer.borderColor = UIColor(named: "Kettleman")?.cgColor

        backgroundColor = .white

        textAlignment = .left
        adjustsFontSizeToFitWidth = true

        returnKeyType = .next

        let rightImage = UIImageView(image: mainIcon)
        rightImage.contentMode = .scaleAspectFit
        rightView = rightImage
        rightViewMode = .unlessEditing

        if alternateIcon != nil {
            setAlternateIcon()
        } else {
            clearButtonMode = .whileEditing
        }
    }

    private func setAlternateIcon() {
        addTarget(self, action: #selector(textFieldDidChange), for: .allEvents)
    }

    @objc func textFieldDidChange() {
        let mainIconImage = UIImageView(image: mainIcon)
        mainIconImage.contentMode = .scaleAspectFit
        let alternateIconImage = UIImageView(image: alternateIcon)
        alternateIconImage.contentMode = .scaleAspectFit

        rightViewMode = .always

        if isEditing {
            rightView = alternateIconImage
        } else {
            rightView = mainIconImage
        }
    }

    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        let rightViewRect = super.rightViewRect(forBounds: bounds)
        return CGRect(x: rightViewRect.origin.x - 10, y: rightViewRect.origin.y, width: rightViewRect.width, height: rightViewRect.height)
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    @objc func tapCancel() {
        resignFirstResponder()
    }
}
