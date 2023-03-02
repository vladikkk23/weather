//
//  MainViewController.swift
//  Weather
//
//  Created by vladikkk on 28/02/2023.
//

import UIKit
import Combine

class MainViewController: UIViewController {
    // MARK: - Properties
    internal let viewModel = MainViewModel()
    internal var cancellables: Set<AnyCancellable> = []
    
    // MARK: - UI
    internal lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    internal lazy var todayWeatherView: TodayWeatherView = {
        let view = TodayWeatherView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    internal lazy var weekForecastCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        collectionview.backgroundColor = .clear
        return collectionview
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .gray
        
        backgroundImageView.downloadImage(urlString: Constants.backgroundImageURLString)
        weekForecastCollectionView.delegate = self
        weekForecastCollectionView.dataSource = self
        weekForecastCollectionView.register(WeekForecastCollectionViewCell.self, forCellWithReuseIdentifier: WeekForecastCollectionViewCell.reuseIdentifier)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
        setupLayout()
    }
}
