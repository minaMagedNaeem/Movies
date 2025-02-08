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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(with cast: Cast) {
        profileName.text = cast.name ?? "N/A"
        
        if let imagePath = cast.profilePath, let url = URL(string: "\(IMAGESBASEURL)\(imagePath)") {
            profileImage.kf.setImage(
                with: url,
                placeholder: UIImage(named: "placeholder"),
                options: [
                    .transition(.fade(0.3)),
                    .cacheOriginalImage
                ]
            )
        }
    }
    
}
