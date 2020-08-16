//
//  NSSignUpProcess.swift
//  N-SIGNIN
//
//  Created by Álvaro Gutiérrez Jácome on 15/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import UIKit

final class NSSignUpProcess: UIPageViewController {
    private let nextPageButton = NSPagerButton(direction: .Next)
    private let previousPageButton = NSPagerButton(direction: .Previous)
    private let processViewControllers = [NSPersonalData(), NSGenderBirth(), NSLogInformation(), NSLogInformation()]
    private let indicatorPage = NSPageIndicator(with: 4)
    private var currentIndex = 0 {
        didSet {
            if currentIndex <= 0 {
                previousPageButton.isHidden = true
                nextPageButton.isHidden = false
            } else if currentIndex >= (processViewControllers.count - 1) {
                nextPageButton.isHidden = true
                previousPageButton.isHidden = false
            } else {
                nextPageButton.isHidden = false
                previousPageButton.isHidden = false
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
        addSubviews()
        layoutViews()
    }

    private func configuration() {
        setupNavBarWithLogo()
        setViewControllers([processViewControllers[currentIndex]], direction: .forward, animated: true, completion: nil)
        setupNextButton()
        setupPreviousButton()
    }

    private func addSubviews() {
        view.addSubview(nextPageButton)
        view.addSubview(previousPageButton)
        view.addSubview(indicatorPage)
    }

    private func layoutViews() {
        layoutNextPageButton()
        layoutPreviousPageButton()
        layoutIndicatorPage()
    }

    private func layoutNextPageButton() {
        nextPageButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nextPageButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
            nextPageButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 256),
            nextPageButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
        ])
    }

    private func layoutPreviousPageButton() {
        previousPageButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            previousPageButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
            previousPageButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            previousPageButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -256),
        ])
    }

    private func layoutIndicatorPage() {
        NSLayoutConstraint.activate([
            indicatorPage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 38),
            indicatorPage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            indicatorPage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -12),
            indicatorPage.heightAnchor.constraint(equalToConstant: 30),
        ])
    }

    private func setupNextButton() {
        nextPageButton.delegate = self
    }

    private func setupPreviousButton() {
        previousPageButton.delegate = self
    }
}

extension NSSignUpProcess: NSPagerButtonDelegate {
    func previousButtonAction() {
        if currentIndex > 0 {
            currentIndex -= 1
            indicatorPage.previusPoint()
            setViewControllers([processViewControllers[currentIndex]], direction: .reverse, animated: true, completion: nil)
        }
    }

    func nextButtonAction() {
        if currentIndex < (processViewControllers.count - 1) {
            currentIndex += 1
            indicatorPage.nextPoint()
            setViewControllers([processViewControllers[currentIndex]], direction: .forward, animated: true, completion: nil)
        }
    }
}
