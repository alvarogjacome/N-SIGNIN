//
//  NSPagerButton.swift
//  N-SIGNIN
//
//  Created by Álvaro Gutiérrez Jácome on 16/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import UIKit

protocol NSPagerButtonDelegate {
    func previousButtonAction()
    func nextButtonAction()
}

final class NSPagerButton: UIButton {
    enum DirectionType {
        case Next
        case Previous
    }

    var delegate: NSPagerButtonDelegate?

    init(direction: DirectionType) {
        super.init(frame: .zero)
        setup(direction: direction)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup(direction: DirectionType) {
        translatesAutoresizingMaskIntoConstraints = false

        switch direction {
            case .Next:
                nextButton()
            case .Previous:
                previousButton()
        }
    }

    private func previousButton() {
        isHidden = true
        setTitle("Anterior", for: .normal)
        setImage(UIImage(named: "Vector-4"), for: .normal)
        contentMode = .center
        imageView?.contentMode = .scaleAspectFit
        imageEdgeInsets = UIEdgeInsets(top: 2, left: 0, bottom: 0, right: 13)
        setTitleColor(UIColor(named: "CorfuWaters"), for: .normal)
        addTarget(self, action: #selector(previousButtonAction), for: .touchUpInside)
    }

    private func nextButton() {
        setTitle("Siguiente", for: .normal)
        setImage(UIImage(named: "Vector-2"), for: .normal)
        semanticContentAttribute = .forceRightToLeft
        contentMode = .center
        imageView?.contentMode = .scaleAspectFit
        imageEdgeInsets = UIEdgeInsets(top: 2, left: 13, bottom: 0, right: 0)
        setTitleColor(UIColor(named: "CorfuWaters"), for: .normal)
        addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
    }

    @objc func previousButtonAction() {
        delegate?.previousButtonAction()
    }

    @objc func nextButtonAction() {
        delegate?.nextButtonAction()
    }
}
