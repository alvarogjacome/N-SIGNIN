//
//  NSLaunchScreen.swift
//  N-SIGNIN
//
//  Created by Álvaro Gutiérrez Jácome on 15/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import UIKit

final class NSLaunchScreen: UIViewController {
    private let backgroundView = UIView()
    private let logoImageView = UIImageView()
    private let loadingImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBackgroundView()
        setupLogoImageView()
        setupLoadingImageView()
        addSubViews()
        layoutSubViews()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

        startLoadingAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            self.navigateToApp()
        }
    }

    private func setupView() {
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    private func setupBackgroundView() {
        backgroundView.backgroundColor = UIColor(named: "DelicateBlue")
    }

    private func setupLogoImageView() {
        logoImageView.image = UIImage(named: "LogoVertical")
        logoImageView.contentMode = .scaleAspectFit
    }

    private func setupLoadingImageView() {
        loadingImageView.image = UIImage(named: "Group")
        loadingImageView.contentMode = .scaleAspectFit
    }

    private func addSubViews() {
        view.addSubview(backgroundView)
        view.addSubview(logoImageView)
        view.addSubview(loadingImageView)
    }

    private func layoutSubViews() {
        layoutBackgroundView()
        layoutImageView()
        layoutLoadingImageView()
    }

    private func layoutBackgroundView() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func layoutImageView() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 155),
            logoImageView.heightAnchor.constraint(equalToConstant: 125),
            logoImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 65),
            logoImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -65)
        ])
    }

    private func layoutLoadingImageView() {
        loadingImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            loadingImageView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 89),
            loadingImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingImageView.heightAnchor.constraint(equalToConstant: 74.8),
            loadingImageView.widthAnchor.constraint(equalToConstant: 71.52)
        ])
    }

    private func startLoadingAnimation() {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(Double.pi * 2)
        rotateAnimation.duration = 1
        rotateAnimation.repeatCount = Float.infinity
        loadingImageView.layer.add(rotateAnimation, forKey: nil)
    }

    private func navigateToApp() {
        UIView.animate(withDuration: 0.5, animations: {
            self.loadingImageView.alpha = 0
        }) { _ in

            let viewControllersInProcess = [NSPersonalData(), NSGenderBirth(), NSLogInformation()]
            let signUpProcess = NSSignUpProcess(viewModel: NSSignUpProcessViewModel(), processViewControllers: viewControllersInProcess, indicator: NSPageIndicator(with: viewControllersInProcess.count))
            let navController = UINavigationController(rootViewController: signUpProcess)
            navController.setNavigationBarHidden(true, animated: false)
            navController.modalPresentationStyle = .overFullScreen
            navController.modalTransitionStyle = .crossDissolve
            self.present(navController, animated: true, completion: nil)
        }
    }
}
