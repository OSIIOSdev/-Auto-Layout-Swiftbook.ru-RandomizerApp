//
//  SettingsViewController.swift
//  RandomizerApp
//
//  Created by OSIIOSdev on 01.04.2025.
//

import UIKit

final class SettingsViewController: UIViewController {

    // MARK: - Private properties
    
    var minimumValueTextField = UITextField()
    var maximumValueTextField = UITextField()
    
    var saveButton = UIButton()
    var cancelButton = UIButton()
    
    var minimumValue = ""
    var maximumValue = ""
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        

        getBackgroundImageView()
        
        navigationController?.navigationBar.isHidden = true
        
        getButtonSettings(title: "Save", button: saveButton)
        getButtonSettings(title: "Cancel", button: cancelButton)
        
        displayedTextFieldsStackView()
        displayedButtonsStackView()
        
        getTextFieldSettings(textField: minimumValueTextField, placeholder: "  minimum value")
        getTextFieldSettings(textField: maximumValueTextField, placeholder: "  maximum value")
        
        
        minimumValueTextField.text = minimumValue
        maximumValueTextField.text = maximumValue
        
    }
    
    
    // MARK: - Override methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        super .touchesBegan(touches, with: event)
        
        view.endEditing(true)
        
    }
    
    
    // MARK: - @IBActions
    
    @IBAction func cancelButtonPressed() {
        
        dismiss(animated: true)
        
    }
    
    
    // MARK: - Private methods

    private func getBackgroundImageView() {
        
        let backgroundImage = UIImage(named: "SettingsBackgroundImage.jpg")
        
        var imageView: UIImageView!
        imageView = UIImageView(frame: UIScreen.main.bounds)
        imageView.contentMode = .scaleToFill
        imageView.image = backgroundImage
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
    }
    
    private func displayedTextFieldsStackView() {
        
        view.addSubview(textFieldsStackView)
        
        [minimumValueTextField, maximumValueTextField].forEach {
            textFieldsStackView.addArrangedSubview($0)
        }
        
        NSLayoutConstraint.activate([
            textFieldsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            textFieldsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textFieldsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textFieldsStackView.heightAnchor.constraint(equalToConstant: 95)
        ])
        
    }
    
    private func displayedButtonsStackView() {
        
        view.addSubview(buttonsStackView)
        
        [saveButton, cancelButton].forEach {
            buttonsStackView.addArrangedSubview( $0 )
        }
        
        NSLayoutConstraint.activate([
            buttonsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        
    }
    
    private lazy var textFieldsStackView = {
        
        let textFieldsStackView = UIStackView()
        
        textFieldsStackView.axis = .vertical
        textFieldsStackView.distribution = .fillEqually
        textFieldsStackView.alignment = .fill
        textFieldsStackView.spacing = 25
        
        textFieldsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        return textFieldsStackView
        
    }()
    
    private func getTextFieldSettings(textField: UITextField, placeholder: String) {
        
        textField.placeholder = placeholder
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.backgroundColor = .systemBackground
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
    }
    
    private lazy var buttonsStackView = {
        
        let buttonsStackView = UIStackView()
        
        buttonsStackView.axis = .vertical
        buttonsStackView.distribution = .fill
        buttonsStackView.alignment = .fill
        buttonsStackView.spacing = 25
        
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        return buttonsStackView
        
    }()
    
    private func getButtonSettings(title: String, button: UIButton) {
        
        view.addSubview(button)
        
        button.layer.cornerRadius = 15
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.borderWidth = 3
        button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.setTitle(title, for: .normal)
        button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
        button.widthAnchor.constraint(equalToConstant: 250).isActive = true
        button.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        switch button {
        case saveButton:
            button.addTarget(self, action: #selector(RandomizerViewController.unwindSegue), for: .touchUpInside)
        case cancelButton:
            button.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        default:
            break
        }
        
        
        
    
    }
    
}
