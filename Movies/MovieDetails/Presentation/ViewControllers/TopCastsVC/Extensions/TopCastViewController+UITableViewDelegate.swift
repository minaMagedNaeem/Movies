//
//  TopCastViewController+UITableViewDelegate.swift
//  Movies
//
//  Created by Mina Maged on 10/02/2025.
//

import UIKit

extension TopCastViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? (viewModel.topActorsCount) : (viewModel.topDirectorsCount)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CastCell", for: indexPath) as! TopCastTableViewCell
        guard let castMember = indexPath.section == 0 ? viewModel.getActor(at: indexPath.row) : viewModel.getDirector(at: indexPath.row) else { return cell }
        cell.bind(with: castMember)
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Top 5 Actors" : "Top 5 Directors"
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = AppColors.background
                
        let titleLabel = UILabel()
        titleLabel.text = section == 0 ? "Top 5 Actors" : "Top 5 Directors"
        titleLabel.textColor = AppColors.text
        titleLabel.font = UIFont(name: AppFont.titleFont, size: 18)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
                
        headerView.addSubview(titleLabel)
                
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])
                
        return headerView
    }
}
