//
//  TopCastTableViewCell.swift
//  Movies
//
//  Created by Mina Maged on 08/02/2025.
//

import UIKit
import Kingfisher

class TopCastTableViewCell: UITableViewCell {

    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupUI() {
        self.backgroundColor = AppColors.background
        profileName.font = UIFont(name: AppFont.bodyFont, size: 16)
        profileName.textColor = AppColors.text
            
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        profileImage.clipsToBounds = true
    }
    
    func bind(with cast: Cast) {
        profileName.text = cast.name ?? "N/A"
        
        if let imagePath = cast.profilePath, let url = URL(string: "\(IMAGESBASEURL)\(imagePath)") {
            profileImage.kf.indicatorType = .activity
            profileImage.kf.setImage(
                with: url,
                options: [
                    .transition(.fade(0.3)),
                    .cacheOriginalImage
                ]
            )
        }
    }
    
}
