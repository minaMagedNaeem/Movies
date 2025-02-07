//
//  MoviesListViewController.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

import UIKit
import SwiftUI

class MoviesListViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    private let moviesListView: MoviesListView
    
    init(moviesListView: MoviesListView) {
            self.moviesListView = moviesListView
            super.init(nibName: "MoviesListViewController", bundle: nil)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let hostingController = UIHostingController(rootView: moviesListView)
                        
        addChild(hostingController)
        hostingController.view.frame = containerView.bounds
        containerView.addSubview(hostingController.view)
                
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
                
        hostingController.didMove(toParent: self)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
