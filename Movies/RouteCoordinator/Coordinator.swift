//
//  Coordinator.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//
import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    func start()
    func navigate(to route: AppRoute)
}
