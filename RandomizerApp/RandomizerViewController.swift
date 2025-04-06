//
//  ViewController.swift
//  RandomizerApp
//
//  Created by OSIIOSdev on 01.04.2025.
//

import UIKit

final class RandomizerViewController: UIViewController {
    
    // MARK: - Private properties
    
    private var minimumValueLabel = UILabel()
    private var maximumValueLabel = UILabel()
    
    let randomValueLabel = UILabel()
    
    let resultButton = UIButton()
    
    let minimumValue = "0"
    let maximumValue = "100"
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        getBackgroundImageView()
        getNavigationBar()
        
        minimumValueLabel = getLabelSettings(textLabel: minimumValue, size: 35, weight: .bold)
        maximumValueLabel = getLabelSettings(textLabel: maximumValue, size: 35, weight: .bold)
        
        displayedStackView()
        getRandomValueLabel()
        
        getResultButton()
        
    }
    
    
    // MARK: - Override methods
    
    @objc override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let settingsViewController = segue.destination as? SettingsViewController else { return }
        
        settingsViewController.minimumValue = minimumValueLabel.text ?? ""
        settingsViewController.maximumValue = maximumValueLabel.text ?? ""
                
    }

    
    // MARK: - @IBAction
    
    @IBAction func getRandomValue() {
        
        randomValueLabel.text = String(Int.random(in: (Int(minimumValueLabel.text ?? "") ?? 0)...(Int(maximumValueLabel.text ?? "") ?? 0)))
        
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        
        guard let settingsViewController = segue.source as? SettingsViewController else { return }
        
        
        minimumValueLabel.text = settingsViewController.minimumValueTextField.text
        maximumValueLabel.text = settingsViewController.maximumValueTextField.text
        
    }
    

    // MARK: - Private methods
    
    private func getNavigationBar() {
        
        title = "Random number"
        
        let navBarAppearence = UINavigationBarAppearance()
        navBarAppearence.configureWithOpaqueBackground()
        
        navBarAppearence.backgroundColor = .clear
        navBarAppearence.shadowColor = .clear
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(presentSettingsViewController))
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.hidesBackButton = true
        
        navigationController?.navigationBar.standardAppearance = navBarAppearence
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearence
        
    }
    
    @objc func presentSettingsViewController() {
        
        let settingsViewController = SettingsViewController()
        
        navigationController?.pushViewController(settingsViewController, animated: true)
        presentedViewController?.modalPresentationStyle = .fullScreen
        presentedViewController?.modalTransitionStyle = .crossDissolve
        
    }
    
    private func getBackgroundImageView() {
        
        let backgroundImage = UIImage(named: "QuestionBackgroundImage.jpg")
        
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
    
    private func getLabelSettings(textLabel: String, size: CGFloat, weight: UIFont.Weight) -> UILabel {
        
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: size, weight: weight)
        label.text = textLabel
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }
    
    private func displayedStackView() {
        
        view.addSubview(valueRangeStackView)
        
        [getLabelSettings(textLabel: "from", size: 20, weight: .regular), minimumValueLabel,
         getLabelSettings(textLabel: "to", size: 20, weight: .regular), maximumValueLabel].forEach {
            valueRangeStackView.addArrangedSubview($0)
        }
        
        NSLayoutConstraint.activate([
            valueRangeStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 35),
            valueRangeStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            valueRangeStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
    }
    
    private lazy var valueRangeStackView = {
        
        let valueRangeStackView = UIStackView()
        
        valueRangeStackView.axis = .horizontal
        valueRangeStackView.distribution = .fillEqually
        valueRangeStackView.alignment = .center
        valueRangeStackView.spacing = 5
        
        valueRangeStackView.translatesAutoresizingMaskIntoConstraints = false
        
        return valueRangeStackView
        
    }()
    
    private func getRandomValueLabel() {
            
        randomValueLabel.text = "?"
        randomValueLabel.font = UIFont.systemFont(ofSize: 150, weight: .bold)
        
        view.addSubview(randomValueLabel)
        randomValueLabel.translatesAutoresizingMaskIntoConstraints = false
            
        NSLayoutConstraint.activate([
            randomValueLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            randomValueLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
    private func getResultButton() {
        
        resultButton.setTitle("Get Result", for: .normal)
        resultButton.backgroundColor = .white
        resultButton.setTitleColor(.black, for: .normal)
        resultButton.layer.borderColor = UIColor.black.cgColor
        resultButton.layer.borderWidth = 3
        resultButton.layer.cornerRadius = 15
        resultButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    
        resultButton.addTarget(self, action: #selector(getRandomValue), for: .touchUpInside)
        
        view.addSubview(resultButton)
        resultButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resultButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultButton.widthAnchor.constraint(equalToConstant: 250),
            resultButton.heightAnchor.constraint(equalToConstant: 55),
            resultButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
        
    }
        
}

