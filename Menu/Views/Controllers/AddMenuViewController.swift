//
//  AddMenuViewController.swift
//  Menu
//
//  Created by Zohra on 02.09.25.
//

import UIKit

protocol AddMenuDelegate: AnyObject {
    func didAddMenuItem(_ title: String)
}

final class AddMenuViewController: UIViewController {
    weak var delegate: AddMenuDelegate?

    private let textField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Yemək adı"
        tf.borderStyle = .roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Yeni Yemək"
        view.backgroundColor = .systemBackground

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .save,
            target: self,
            action: #selector(saveTapped)
        )

        view.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textField.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    @objc private func saveTapped() {
        let text = (textField.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        guard !text.isEmpty else { return }
        delegate?.didAddMenuItem(text)
        navigationController?.popViewController(animated: true)
    }
}
