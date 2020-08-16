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

final class NSTableViewCell: UITableViewCell {
    static let reuseID = "infoCell"

    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let secureField = UITextField()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configure()
        self.setupSecureField()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(content: (String, String, FieldType)) {
        self.titleLabel.text = content.0
        self.descriptionLabel.text = content.1
        self.secureField.text = content.1

        self.configureSecureField(type: content.2)
    }

    private func setupSecureField() {
        self.secureField.isSecureTextEntry = true
        self.secureField.isHidden = true
        self.secureField.isEnabled = false

        let eyeIcon = UIImageView(image: UIImage(named: "Group 6"))
        let gesture = UIGestureRecognizer(target: self, action: #selector(self.togglesSecurity))
        eyeIcon.contentMode = .scaleAspectFit
        eyeIcon.addGestureRecognizer(gesture)

        self.secureField.rightView = eyeIcon
        self.secureField.rightViewMode = .always
    }

    @objc private func togglesSecurity() {
        self.secureField.isSecureTextEntry.toggle()
    }

    private func configureSecureField(type: FieldType) {
        switch type {
            case .Normal:
                self.descriptionLabel.isHidden = false
                self.secureField.isHidden = true

            case .Secure:
                self.secureField.isHidden = false
                self.descriptionLabel.isHidden = true
        }
    }

    private func configure() {
        addSubview(self.titleLabel)
        addSubview(self.descriptionLabel)
        addSubview(self.secureField)

        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.secureField.translatesAutoresizingMaskIntoConstraints = false

        accessoryType = .none
        backgroundColor = .clear

        NSLayoutConstraint.activate([
            self.titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            self.titleLabel.widthAnchor.constraint(equalToConstant: 100),
            self.titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 40),

            self.descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor, constant: 25),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20),
            self.descriptionLabel.heightAnchor.constraint(equalToConstant: 40),

            self.secureField.centerYAnchor.constraint(equalTo: centerYAnchor),
            self.secureField.leadingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor, constant: 25),
            self.secureField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20),
            self.secureField.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
