//
//  MoviesAPI.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

import Foundation
import Moya
import Alamofire
import Reachability

enum MoviesAPI : TargetType {
        
    case getMovies(page: Int)
    case searchMovies(page: Int, keyword: String)
    case getMovieDetails(movieId: Int)
    case getSimilarMovies(movieId: Int)
    
    public var baseURL: URL {
        return URL(string: BASEURL)!
    }
    
    public var path: String {
        switch self {
        case .getMovies:
            return "/discover/movie"
        case .searchMovies:
            return "/search/movie"
        case .getMovieDetails(let movieId):
            return "/movie/\(String(movieId))"
        case .getSimilarMovies(let movieId):
            return "/movie/\(movieId)/similar"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getMovies:
            return .get
        case .searchMovies:
            return .get
        case .getMovieDetails:
            return .get
        case .getSimilarMovies:
            return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .getMovies(let page):
            
            let parameters: [String: Any] = [
                "include_adult": false,
                "include_video": false,
                "language": "en-US",
                "sort_by": "popularity.desc",
                "page": page
            ]
            
            return .requestParameters(parameters: parameters,
                                      encoding: URLEncoding.default)
        case .searchMovies(let page, let keyword):
            let parameters: [String: Any] = [
                "include_adult": false,
                "language": "en-US",
                "page": page,
                "query": keyword
            ]
            
            return .requestParameters(parameters: parameters,
                                      encoding: URLEncoding.default)
            
        case .getMovieDetails:
            return .requestPlain
        case .getSimilarMovies:
            return .requestPlain
        }
    }
    
    public var isSilent : Bool {
        switch self {
        default:
            return false
        }
    }
    
    public var headers: [String: String]? {
        
        guard let token = AccessToken.getAPIKey() else {
            fatalError("Cannot retrieve access token from local storage")
        }
        
        let headers : [String:String] = ["Authorization":"Bearer \(token)",
                                         "Content-Type": "application/json"]
        
        switch self {
        default:
            return headers
        }
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}

final class ErrorHandlerPlugin : PluginType {
    
    func willSend(_ request: RequestType, target: TargetType) {
        
    }
    
    func didReceive(_ result: Result<Moya.Response, MoyaError>, target: TargetType) {
        
        if (target as! MoviesAPI).isSilent {
            return
        }
        
        if !(Reachability.isConnectedToInternet()) {
            return
        }
        
        guard case Result.failure(let error) = result else { return }
        
        print(try? error.response?.mapJSON() as Any)
        
    }
}

let moviesAPIProvider = MoyaProvider<MoviesAPI>.init(plugins: [NetworkLoggerPlugin()])
