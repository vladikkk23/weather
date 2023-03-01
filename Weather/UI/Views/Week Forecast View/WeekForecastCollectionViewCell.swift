//
//  WeekForecastCollectionViewCell.swift
//  Weather
//
//  Created by vladikkk on 01/03/2023.
//

import UIKit

class WeekForecastCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    static let reuseIdentifier = "WeekForecastCollectionViewCellIdentifier"
    
    // MARK: - UI
    internal lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    internal lazy var minTempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 14)
        label.textColor = .white
        return label
    }()
    
    internal lazy var maxTempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 14)
        label.textColor = .white
        return label
    }()
    
    internal lazy var dateTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 14)
        label.textColor = .white
        return label
    }()
    
    internal lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - WeekForecastCollectionViewCell Layouts
typealias WeekForecastCollectionViewCellLayouts = WeekForecastCollectionViewCell
extension WeekForecastCollectionViewCellLayouts {
    func setupLayout() {
        stackView.addArrangedSubview(dateTimeLabel)
        stackView.addArrangedSubview(iconImage)
        stackView.addArrangedSubview(minTempLabel)
        stackView.addArrangedSubview(maxTempLabel)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: widthAnchor),
            stackView.heightAnchor.constraint(equalTo: heightAnchor)
        ])
    }
}

// MARK: - WeekForecastCollectionViewCell Data
typealias WeekForecastCollectionViewCellData = WeekForecastCollectionViewCell
extension WeekForecastCollectionViewCellData {
    func setupCellData(data: WeatherForecastDayModel) {
        iconImage.downloadImage(urlString: data.day.condition.icon)
        dateTimeLabel.text = data.date.getDateStringFromUTC()
        minTempLabel.text = "Min: \(data.day.mintempC) °C"
        maxTempLabel.text = "Max: \(data.day.maxtempC) °C"
    }
}
