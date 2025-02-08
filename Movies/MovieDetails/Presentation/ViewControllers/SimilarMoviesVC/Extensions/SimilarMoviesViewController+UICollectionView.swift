//
//  SimilarMoviesViewController+UICollectionView.swift
//  Movies
//
//  Created by Mina Maged on 08/02/2025.
//
import UIKit

extension SimilarMoviesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.similarMoviesCount
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SimilarMoviesCollectionViewCell.identifier, for: indexPath) as! SimilarMoviesCollectionViewCell
        guard let movie = viewModel.getSimilarMovie(at: indexPath.item) else {return cell}
        cell.bind(with: movie)
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 150, height: 250)
//    }
    
//    extension SimilarMoviesViewController: UICollectionViewDelegateFlowLayout {
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            let spacing: CGFloat = 16
//            let numberOfColumns: CGFloat = 2
//            let totalSpacing = spacing * (numberOfColumns + 1)
//            let itemWidth = (collectionView.bounds.width - totalSpacing) / numberOfColumns
//            let itemHeight = itemWidth * 1.5
//            return CGSize(width: itemWidth, height: itemHeight)
//        }
//
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//            return 16
//        }
//
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//            return 16
//        }
//    }

}
