//
//  NSSignUpProcessPageViewController.swift
//  N-SIGNIN
//
//  Created by Álvaro Gutiérrez Jácome on 15/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import UIKit

protocol NSSignUpProcessDelegate {
    func updateData(model: NSSignUpProcessViewModel)
}

final class NSSignUpProcessPageViewController: UIPageViewController {
    private let model: NSSignUpProcessViewModel
    private let processViewControllers: [UIViewController]
    private let indicatorPage: NSPageIndicator

    private let nextPageButton = NSPagerButton(direction: .Next)
    private let previousPageButton = NSPagerButton(direction: .Previous)
    private let titleLabel = UILabel()

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

    var signUpProcessDelegate: NSSignUpProcessDelegate?

    init(viewModel: NSSignUpProcessViewModel, processViewControllers: [UIViewController], indicator: NSPageIndicator) {
        self.model = viewModel
        self.indicatorPage = indicator
        self.processViewControllers = processViewControllers
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
        addViews()
        layoutViews()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    private func configuration() {
        setupNavBarWithLogo()
        setupTitleLabel()
        createDismissTapGesture()
        updatePage(direction: .forward)
        setupNextButton()
        setupPreviousButton()
    }

    private func addViews() {
        view.addSubview(nextPageButton)
        view.addSubview(previousPageButton)
        view.addSubview(indicatorPage)
        view.addSubview(titleLabel)
    }

    private func layoutViews() {
        layoutNextPageButton()
        layoutPreviousPageButton()
        layoutIndicatorPage()
        layoutTitleLabel()
    }

    private func layoutNextPageButton() {
        NSLayoutConstraint.activate([
            nextPageButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
            nextPageButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 256),
            nextPageButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
        ])
    }

    private func layoutPreviousPageButton() {
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

    private func layoutTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: indicatorPage.bottomAnchor, constant: 37),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 23),
        ])
    }

    private func setupTitleLabel() {
        titleLabel.font = UIFont.systemFont(ofSize: 20.0)
        titleLabel.textColor = UIColor(named: "Kettleman")
    }

    private func setupNextButton() {
        nextPageButton.delegate = self
    }

    private func setupPreviousButton() {
        previousPageButton.delegate = self
    }

    private func updatePage(direction: NavigationDirection) {
        setViewControllers([processViewControllers[currentIndex]], direction: direction, animated: true, completion: nil)
        titleLabel.text = processViewControllers[currentIndex].title
    }

    private func createDismissTapGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }

    func getViewModel() -> NSSignUpProcessViewModel {
        model
    }
}

extension NSSignUpProcessPageViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        let nextResponder = textField.superview?.superview?.viewWithTag(nextTag) as UIResponder?

        if nextResponder != nil {
            nextResponder?.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            nextButtonAction()
        }

        return false
    }
}

extension NSSignUpProcessPageViewController: NSPagerButtonDelegate {
    func previousButtonAction() {
        if currentIndex > 0 {
            currentIndex -= 1
            indicatorPage.previusPoint()
            updatePage(direction: .reverse)
        }
    }

    func nextButtonAction() {
        if currentIndex < (processViewControllers.count - 1) {
            signUpProcessDelegate?.updateData(model: model)
            currentIndex += 1
            indicatorPage.nextPoint()
            updatePage(direction: .forward)
        }
    }
}
