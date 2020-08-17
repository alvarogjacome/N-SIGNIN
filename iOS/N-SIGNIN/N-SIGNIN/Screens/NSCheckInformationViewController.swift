//
//  NSCheckInformationViewController.swift
//  N-SIGNIN
//
//  Created by Álvaro Gutiérrez Jácome on 16/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import UIKit

final class NSCheckInformationViewController: UIViewController {
    private let infoTableView: UITableView
    private let model: NSSignUpProcessViewModel

    init(viewModel: NSSignUpProcessViewModel) {
        self.model = viewModel
        self.infoTableView = UITableView()
        super.init(nibName: nil, bundle: nil)

        title = "Check your information"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "ColdMorning")

        self.setupTable()
        self.addViews()
        self.layoutInfoTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.infoTableView.reloadData()
    }

    private func setupTable() {
        self.infoTableView.delegate = self
        self.infoTableView.dataSource = self
        self.infoTableView.backgroundColor = .clear
        self.infoTableView.register(NSTableViewCell.self, forCellReuseIdentifier: NSTableViewCell.reuseID)
        self.infoTableView.separatorColor = UIColor(named: "Kettleman")
        self.infoTableView.separatorInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        self.infoTableView.translatesAutoresizingMaskIntoConstraints = false
        self.infoTableView.isScrollEnabled = false
        self.infoTableView.allowsSelection = false
        self.infoTableView.tableFooterView = UIView()
    }

    private func addViews() {
        view.addSubview(self.infoTableView)
    }

    private func layoutInfoTableView() {
        self.infoTableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.infoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            self.infoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            self.infoTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 162),
            self.infoTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -126),

        ])
    }
}

extension NSCheckInformationViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.model.getModelElements().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let content = self.model.getModelElements()
        let cell = tableView.dequeueReusableCell(withIdentifier: NSTableViewCell.reuseID) as! NSTableViewCell
        cell.set(content: content[indexPath.row])
        return cell
    }
}


