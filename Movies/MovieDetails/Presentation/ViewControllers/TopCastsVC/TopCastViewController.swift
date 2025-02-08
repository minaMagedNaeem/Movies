//
//  TopCastViewController.swift
//  Movies
//
//  Created by Mina Maged on 08/02/2025.
//

import UIKit

class TopCastViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel: MovieDetailsViewModel

        init(viewModel: MovieDetailsViewModel) {
            self.viewModel = viewModel
            super.init(nibName: "TopCastViewController", bundle: nil)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override func viewDidLoad() {
            super.viewDidLoad()
            setupTableView()
            
            viewModel.fetchCast()
        }
        
        private func setupTableView() {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UINib(nibName: "TopCastTableViewCell", bundle: nil), forCellReuseIdentifier: "CastCell")
        }

}

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
}

extension TopCastViewController: GetTopCastDelegate {
    func didFetchTopCast() {
        tableView.reloadData()
    }
    
    func didStartLoading() {
        self.tableView.startProgressAnim()
    }
    
    func didFinishLoading() {
        self.tableView.stopProgressAnim()
        self.tableView.layoutIfNeeded()
    }
    
    func didFailWithError(_ error: String) {
        didFinishLoading()
        self.showErrorPopup(message: error)
    }
}
