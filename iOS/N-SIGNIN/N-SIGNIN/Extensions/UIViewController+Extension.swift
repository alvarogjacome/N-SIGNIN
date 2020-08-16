//
//  UIViewController+Extension.swift
//  N-SIGNIN
//
//  Created by Álvaro Gutiérrez Jácome on 15/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import UIKit

extension UIViewController {
    func setupNavBarWithLogo() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        let logo = UIImage(named: "Logo Horizontal Negativo Trans")
        let imageView = UIImageView(image: logo)
        imageView.contentMode = .scaleToFill
        navigationItem.titleView = imageView
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor(named: "Kettleman")
    }
}

