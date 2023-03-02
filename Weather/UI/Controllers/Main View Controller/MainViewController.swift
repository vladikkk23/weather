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
    internal var compactConstraints: [NSLayoutConstraint] = []
    internal var regularConstraints: [NSLayoutConstraint] = []
    internal var sharedConstraints: [NSLayoutConstraint] = []
    
    internal lazy var viewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        weekForecastCollectionView.delegate = self
        weekForecastCollectionView.dataSource = self
        weekForecastCollectionView.register(WeekForecastCollectionViewCell.self, forCellWithReuseIdentifier: WeekForecastCollectionViewCell.reuseIdentifier)
        
        setupBindings()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        
        NSLayoutConstraint.activate(sharedConstraints)
        layoutTrait(traitCollection: UIScreen.main.traitCollection)
    }
}
