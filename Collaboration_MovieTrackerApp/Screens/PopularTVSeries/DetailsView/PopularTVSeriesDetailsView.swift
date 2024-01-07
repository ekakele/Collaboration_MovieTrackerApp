//
//  PopularTVSeriesDetailsView.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 05.01.24.
//

import SwiftUI

struct PopularTVSeriesDetailsView: View {
    @StateObject var viewModel = PopularTVSeriesDetailsViewModel()
    @State var id: Int
    
    var body: some View {
        if let showDetails = viewModel.showDetails {
            VStack{
                Text(String(id))
            }
            .onAppear {
                viewModel.fetchDetails(id: id)
            }
        }
    }
}
    
    #Preview {
        PopularTVSeriesDetailsView( id: 12513)
    }
