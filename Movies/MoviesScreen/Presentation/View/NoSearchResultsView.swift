//
//  NoSearchResultsView.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//
import SwiftUI

struct NoSearchResultsView: View {
    var body: some View {
        VStack {
            Image(systemName: "magnifyingglass")  // Glass icon
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.gray)
                .opacity(0.5)
            
            Text("No results found")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(.gray)
                .padding(.top, 8)
        }
        .padding(.top, 50)
    }
}
