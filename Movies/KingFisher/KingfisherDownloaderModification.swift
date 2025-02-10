//
//  KingfisherDownloaderModification.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

import Kingfisher

func setKingfisherToken() {
    let token = AccessToken.getAPIKey()
    
    guard let token = token else { return }
    
    let modifier = AnyModifier { request in
        var newRequest = request
        newRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        return newRequest
    }
    
    KingfisherManager.shared.defaultOptions = [.requestModifier(modifier)]
}
