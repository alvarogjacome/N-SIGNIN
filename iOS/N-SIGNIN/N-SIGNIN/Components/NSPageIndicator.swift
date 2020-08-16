//
//  NSStepIndicator.swift
//  N-SIGNIN
//
//  Created by Álvaro Gutiérrez Jácome on 16/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import UIKit

final class NSPageIndicator: UIView {
    private let line: UIView
    private let dots: [NSStepLabel]
    private let stackView: UIStackView
    private var currentStep: Int

    init(with steps: Int) {
        self.line = UIView()
        self.currentStep = 0
        self.dots = (0 ..< steps).map { NSStepLabel($0 + 1) }
        self.stackView = UIStackView(arrangedSubviews: dots)
        super.init(frame: .zero)

        setupView()

        setupLine()
        setupStackView()

        addSubViews()
        layoutViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false

        dots.first!.setEditing()
    }

    private func setupLine() {
        line.backgroundColor = UIColor(named: "Kettleman")
    }

    private func setupStackView() {
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.alignment = .center
    }

    private func addSubViews() {
        addSubview(line)
        addSubview(stackView)
    }

    private func layoutViews() {
        layoutLine()
        layoutStackView()
    }

    private func layoutLine() {
        line.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            line.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            line.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            line.centerYAnchor.constraint(equalTo: centerYAnchor),
            line.heightAnchor.constraint(equalToConstant: 4),
        ])
    }

    private func layoutStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 30),
        ])
    }

    func nextPoint() {
        guard currentStep < dots.count else { return }
        dots[currentStep].setCompleted()
        currentStep += 1
        dots[currentStep].setEditing()
    }

    func previusPoint() {
        guard currentStep > 0 else { return }
        dots[currentStep].setIncompleted()
        currentStep -= 1
        dots[currentStep].setEditing()
    }
}
