//
//  TopCastViewController.swift
//  Movies
//
//  Created by Mina Maged on 08/02/2025.
//

import UIKit

class TopCastViewController: UIViewController {
    
    @IBOutlet weak var castLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel: MovieDetailsViewModel
    
    init(viewModel: MovieDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "TopCastViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = AppColors.background
        
        castLabel.textColor = AppColors.text
        castLabel.font = UIFont(name: AppFont.titleFont, size: 22)
        
        setupTableView()
        
        viewModel.fetchCast()
    }
    
    private func setupTableView() {
        
        tableView.backgroundColor = AppColors.background
        tableView.tableFooterView = UIView()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TopCastTableViewCell", bundle: nil), forCellReuseIdentifier: "CastCell")
    }
}
