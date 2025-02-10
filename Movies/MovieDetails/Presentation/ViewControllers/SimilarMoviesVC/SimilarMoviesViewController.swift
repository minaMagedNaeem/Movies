//
//  SimilarMoviesViewController.swift
//  Movies
//
//  Created by Mina Maged on 08/02/2025.
//

import UIKit

class SimilarMoviesViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var screenTitle: UILabel!
    
    let viewModel: MovieDetailsViewModel
    
    init(viewModel: MovieDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "SimilarMoviesViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = AppColors.background
        view.backgroundColor = AppColors.background
        
        screenTitle.textColor = AppColors.text
        screenTitle.font = UIFont(name: AppFont.titleFont, size: 22)
        
        setupCollectionView()
        
        loadSimilarMovies()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureCollectionViewLayout()
    }
    
    private func configureCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 16
        let numberOfColumns: CGFloat = 2
        
        let collectionViewWidth = collectionView.bounds.width
        let totalSpacing = spacing * (numberOfColumns + 1)
        let itemWidth = (collectionViewWidth - totalSpacing) / numberOfColumns
        let itemHeight = itemWidth * 1.5
        
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        
        collectionView.collectionViewLayout = layout
    }
    
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "SimilarMoviesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: SimilarMoviesCollectionViewCell.identifier)
    }
    
    private func loadSimilarMovies() {
        viewModel.fetchSimilarMovies()
    }
}
