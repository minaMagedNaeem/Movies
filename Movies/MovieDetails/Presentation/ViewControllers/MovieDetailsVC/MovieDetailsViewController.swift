//
//  MovieDetailsViewController.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var revenueLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var addToWatchlistButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    private let viewModel: MovieDetailsViewModel
    
    init(viewModel: MovieDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "MovieDetailsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        loadMovieDetails()
        
        bindAddToWatchListButton(with: viewModel.movieIsAddedToWatchList)
    }
    
    private func loadMovieDetails() {
        viewModel.fetchMovieDetails()
    }
    
    private func setupUI() {
        view.backgroundColor = AppColors.background
        scrollView.backgroundColor = AppColors.background
        
        movieImageView.layer.cornerRadius = 12
        movieImageView.clipsToBounds = true
        
        titleLabel.textColor = AppColors.text
        taglineLabel.textColor = AppColors.accent
        overviewLabel.textColor = AppColors.text.withAlphaComponent(0.8)
        releaseDateLabel.textColor = AppColors.accent
        revenueLabel.textColor = AppColors.primary
        statusLabel.textColor = AppColors.primary
        
        addToWatchlistButton.backgroundColor = AppColors.primary
        addToWatchlistButton.setTitleColor(AppColors.text, for: .normal)
        addToWatchlistButton.layer.cornerRadius = 8
    }
    
    func updateUI(with movieDetails: MovieDetails) {
        bindLabels(with: movieDetails)
        bindImage(with: movieDetails.posterPath)
    }
    
    private func bindLabels(with movieDetails: MovieDetails) {
        titleLabel.text = movieDetails.title
        taglineLabel.text = movieDetails.tagline
        overviewLabel.text = movieDetails.overview
        releaseDateLabel.text = "Release Date: \(getDateRepresentation(from: movieDetails.releaseDate))"
        revenueLabel.text = "Revenue: $\(movieDetails.revenue ?? 0)"
        statusLabel.text = "Status: \(movieDetails.status ?? "N/A")"
    }
    
    private func getDateRepresentation(from date: Date?) -> String {
        guard let date = date else { return "N/A" }
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        return formatter.string(from: date)
    }
    
    private func bindImage(with imagePath: String?) {
        if let imagePath = imagePath, let url = URL(string: "\(IMAGESBASEURL)\(imagePath)") {
            movieImageView.kf.indicatorType = .activity
            movieImageView.kf.setImage(
                with: url,
                options: [
                    .transition(.fade(0.3)),
                    .cacheOriginalImage
                ]
            )
        }
    }
    
    private func bindAddToWatchListButton(with movieIsAddedToWatchList: Bool) {
        
        addToWatchlistButton.tintColor = .white
        
        addToWatchlistButton.setTitle("Add to Watch List", for: .normal)
        addToWatchlistButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        addToWatchlistButton.setTitleColor(AppColors.text.withAlphaComponent(0.7), for: .normal)
        addToWatchlistButton.backgroundColor = AppColors.cardBackground
        addToWatchlistButton.layer.cornerRadius = 8
        
        addToWatchlistButton.setTitle("On Watchlist", for: .selected)
        addToWatchlistButton.setImage(UIImage(systemName: "bookmark.fill"), for: .selected)
        addToWatchlistButton.setTitleColor(AppColors.text, for: .selected)
        addToWatchlistButton.backgroundColor = AppColors.primary
        
        addToWatchlistButton.isSelected = movieIsAddedToWatchList
    }
    
    
    @IBAction func addToWatchlistPressed(_ sender: Any) {
        addToWatchlistButton.isSelected = !addToWatchlistButton.isSelected
        
        viewModel.toggleMovieAddToWatchlist()
    }
}
