//
//  NSTextField.swift
//  N-SIGNIN
//
//  Created by Álvaro Gutiérrez Jácome on 15/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import UIKit

class NSTextField: UITextField {
    private let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

    init(iconImage: UIImage?) {
        super.init(frame: .zero)

        configuration(iconImage: iconImage)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configuration(iconImage: UIImage?) {
        translatesAutoresizingMaskIntoConstraints = false

        layer.cornerRadius = 3
        layer.borderWidth = 1
        layer.borderColor = UIColor(named: "Kettleman")?.cgColor

        textAlignment = .left
        adjustsFontSizeToFitWidth = true

        returnKeyType = .next
        clearButtonMode = .whileEditing

        let rightImage = UIImageView(image: iconImage)
        rightImage.contentMode = .scaleAspectFit

        rightView = rightImage
        rightViewMode = .unlessEditing
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
}


