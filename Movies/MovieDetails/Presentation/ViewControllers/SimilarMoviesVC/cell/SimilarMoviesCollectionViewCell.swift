//
//  SimilarMoviesCollectionViewCell.swift
//  Movies
//
//  Created by Mina Maged on 08/02/2025.
//

import UIKit
import Kingfisher

class SimilarMoviesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SimilarMovieCell"

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bind(with movie: Movie) {
        movieTitle.text = movie.title
        
        if let imagePath = movie.posterPath, let url = URL(string: "\(IMAGESBASEURL)\(imagePath)") {
            movieImage.kf.indicatorType = .activity
            movieImage.kf.setImage(
                with: url,
                placeholder: UIImage(named: "placeholder"),
                options: [
                    .transition(.fade(0.3)), // Smooth fade-in animation
                    .cacheOriginalImage // Cache the image
                ]
            )
        }
    }
}
