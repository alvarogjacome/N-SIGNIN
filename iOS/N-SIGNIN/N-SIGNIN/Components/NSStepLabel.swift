//
//  NSStepLabel.swift
//  N-SIGNIN
//
//  Created by Álvaro Gutiérrez Jácome on 16/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import UIKit

final class NSStepLabel: UILabel {
    private let pageNumber: Int

    init(_ pageNumber: Int) {
        self.pageNumber = pageNumber
        super.init(frame: .zero)

        configuration()
    }

    private func configuration() {
        textAlignment = .center
        layer.cornerRadius = 15
        layer.borderColor = UIColor(named: "Kettleman")?.cgColor
        layer.borderWidth = 1
        setIncompleted()
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 30, height: 30)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setCompleted() {
        layer.backgroundColor = UIColor(named: "DistantHorizon")?.cgColor
        textColor = UIColor(named: "Kettleman")
        text = String(pageNumber)
        transform = CGAffineTransform(scaleX: 1, y: 1)
    }

    func setEditing() {
        layer.backgroundColor = UIColor(named: "DistantHorizon")?.cgColor
        textColor = UIColor(named: "Kettleman")
        text = String(pageNumber)
        transform = CGAffineTransform(scaleX: 1.33, y: 1.33)
    }

    func setIncompleted() {
        layer.backgroundColor = UIColor(named: "Kettleman")?.cgColor
        text = nil
        transform = CGAffineTransform(scaleX: 1, y: 1)
    }
}
