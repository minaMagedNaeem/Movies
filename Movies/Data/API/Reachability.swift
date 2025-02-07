//
//  Reachability.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

import Foundation
import Alamofire

class Reachability {
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
