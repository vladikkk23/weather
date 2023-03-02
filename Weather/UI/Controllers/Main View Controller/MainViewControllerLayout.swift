//
//  MainViewControllerLayout.swift
//  Weather
//
//  Created by vladikkk on 28/02/2023.
//

import UIKit


// MARK: - MainViewController Layouts
typealias MainViewControllerLayout = MainViewController
extension MainViewControllerLayout {
    internal func setupLayout() {
        view.addSubview(viewContainer)
        viewContainer.addSubview(todayWeatherView)
        viewContainer.addSubview(weekForecastCollectionView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        sharedConstraints.append(contentsOf: [
            viewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            viewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewContainer.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        
        regularConstraints.append(contentsOf: [
            todayWeatherView.trailingAnchor.constraint(equalTo: viewContainer.centerXAnchor, constant: -128),
            todayWeatherView.topAnchor.constraint(equalTo: viewContainer.topAnchor, constant: 16),
            todayWeatherView.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor, constant: -16),
            
            weekForecastCollectionView.leadingAnchor.constraint(equalTo: todayWeatherView.trailingAnchor, constant: 64),
            weekForecastCollectionView.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant: -32),
            weekForecastCollectionView.centerYAnchor.constraint(equalTo: viewContainer.centerYAnchor),
            weekForecastCollectionView.heightAnchor.constraint(equalTo: viewContainer.heightAnchor, multiplier: 0.5)
        ])
        
        compactConstraints.append(contentsOf: [
            todayWeatherView.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor),
            todayWeatherView.bottomAnchor.constraint(equalTo: viewContainer.centerYAnchor, constant: -32),
            todayWeatherView.heightAnchor.constraint(equalTo: viewContainer.heightAnchor, multiplier: 0.4),
            todayWeatherView.widthAnchor.constraint(equalTo: viewContainer.widthAnchor, multiplier: 0.8),
            
            weekForecastCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weekForecastCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95),
            weekForecastCollectionView.topAnchor.constraint(equalTo: todayWeatherView.bottomAnchor, constant: 60),
            weekForecastCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func layoutTrait(traitCollection: UITraitCollection) {
        if (!sharedConstraints[0].isActive) {
            NSLayoutConstraint.activate(sharedConstraints)
        }
        if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular {
            if regularConstraints.count > 0 && regularConstraints[0].isActive {
                NSLayoutConstraint.deactivate(regularConstraints)
            }
            NSLayoutConstraint.activate(compactConstraints)
        } else {
            if compactConstraints.count > 0 && compactConstraints[0].isActive {
                NSLayoutConstraint.deactivate(compactConstraints)
            }
            NSLayoutConstraint.activate(regularConstraints)
        }
        
        let colorTop =  UIColor(red: 0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 0/255.0, green: 0/255.0, blue: 128.0/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        viewContainer.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        layoutTrait(traitCollection: traitCollection)
    }
}
