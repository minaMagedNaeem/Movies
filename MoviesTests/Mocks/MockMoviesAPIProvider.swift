//
//  MockMoviesAPIProvider.swift
//  Movies
//
//  Created by Mina Maged on 11/02/2025.
//

import XCTest
@testable import Movies
import Moya

class MockMoviesAPIProvider: MoyaProvider<MoviesAPI> {
    var mockResponse: Result<Moya.Response, MoyaError>?

    init() {
        super.init(endpointClosure: { target in
            let url = target.baseURL.appendingPathComponent(target.path).absoluteString
            return Endpoint(
                url: url,
                sampleResponseClosure: { .networkResponse(200, Data()) }, // Default empty response
                method: target.method,
                task: target.task,
                httpHeaderFields: target.headers
            )
        }, stubClosure: MoyaProvider.immediatelyStub) // Ensure immediate response
    }

    override func request(_ target: MoviesAPI, callbackQueue: DispatchQueue? = nil, progress: ProgressBlock? = nil, completion: @escaping Completion) -> Cancellable {
        if let response = mockResponse {
            completion(response)
        } else {
            let error = MoyaError.underlying(
                NSError(domain: "MockMoviesAPIProvider",
                        code: -1,
                        userInfo: [NSLocalizedDescriptionKey: "No mock response set"]),
                nil
            )
            completion(.failure(error))
        }
        return CancellableWrapper()
    }
}

class CancellableWrapper: Cancellable {
    var isCancelled: Bool = false
    func cancel() {
        isCancelled = true
    }
}
