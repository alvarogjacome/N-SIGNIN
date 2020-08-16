//
//  NSTextField+Extension.swift
//  N-SIGNIN
//
//  Created by Álvaro Gutiérrez Jácome on 16/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import UIKit

protocol NSTextFieldPickerDelegate {
    func numberOfRows() -> Int
    func titleForRow(row: Int) -> String?
    func didSelectRow(row: Int) -> String?
}

extension NSTextField: UIPickerViewDataSource, UIPickerViewDelegate {
    func pickerMode() -> NSTextField {
        let picker = UIPickerView()

        picker.delegate = self
        picker.dataSource = self
        inputView = picker

        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(title: "Done", style: .plain, target: nil, action: #selector(tapDonePicker))
        toolBar.setItems([flexible, done], animated: false)
        inputAccessoryView = toolBar

        return self
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerDelegate?.numberOfRows() ?? 0
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        pickerDelegate?.titleForRow(row: row)
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        text = pickerDelegate?.didSelectRow(row: row)
    }

    @objc func tapDonePicker() {
        if let text = text, text.isEmpty {
            self.text = pickerDelegate?.didSelectRow(row: 0)
        }
        resignFirstResponder()
    }
}

extension NSTextField {
    func dateMode() -> NSTextField {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        inputView = datePicker

        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel))
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: #selector(tapDoneDatePicker))
        toolBar.setItems([cancel, flexible, barButton], animated: false)
        inputAccessoryView = toolBar

        return self
    }

    @objc func tapDoneDatePicker() {
        if let datePicker = inputView as? UIDatePicker {
            let dateformatter = DateFormatter()
            dateformatter.dateStyle = .short
            dateformatter.dateFormat = "dd-MM-yyyy"
            text = dateformatter.string(from: datePicker.date)
        }
        resignFirstResponder()
    }
}
