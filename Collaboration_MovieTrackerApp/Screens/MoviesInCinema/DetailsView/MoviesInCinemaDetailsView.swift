//
//  MoviesInCinemaDetailsView.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 05.01.24.
//

import SwiftUI

struct MoviesInCinemaDetailsView: View {
    
    //MARK: Properties
    @StateObject private var viewModel = MoviesInCinemaDetailsViewModel()
    
    var body: some View {
        Text(viewModel.reviewResults.first?.author ?? "-")
    }
}

#Preview {
    MoviesInCinemaDetailsView()
}
