//
//  TodayWeatherView.swift
//  Weather
//
//  Created by vladikkk on 01/03/2023.
//

import UIKit

class TodayWeatherView: UIView {
    // MARK: - Properties
    internal lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    internal lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Heavy", size: 18)
        label.textColor = .white
        return label
    }()
    
    internal lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 42)
        label.textColor = .white
        return label
    }()
    
    internal lazy var dateTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Medium", size: 16)
        label.textColor = .white
        return label
    }()
    
    internal lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 12
        return stackView
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Methods
    private func setupView() {
        stackView.addArrangedSubview(iconImage)
        stackView.addArrangedSubview(cityLabel)
        stackView.addArrangedSubview(countryLabel)
        stackView.addArrangedSubview(dateTimeLabel)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            stackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9)
        ])
    }
}
