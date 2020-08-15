//
//  NSPageController.swift
//  N-SIGNIN
//
//  Created by Álvaro Gutiérrez Jácome on 15/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import UIKit

final class NSPageController: UIPageViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavBar()
    }

    private func setupView() {
        view.backgroundColor = UIColor(named: "ColdMorning")
    }

    private func setupNavBar() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        let logo = UIImage(named: "Logo Horizontal Negativo Trans")
        let imageView = UIImageView(image: logo)
        imageView.contentMode = .scaleToFill
        navigationItem.titleView = imageView
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor(named: "Kettleman")
    }
}
