//
//  SimilarMoviesViewController.swift
//  Movies
//
//  Created by Mina Maged on 08/02/2025.
//

import UIKit

class SimilarMoviesViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
        
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
        setupCollectionView()
        loadSimilarMovies()
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
