//
//  PopularPersonsDetailsView.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 05.01.24.
//

import SwiftUI

struct PopularPersonsDetailsView: View {
    // MARK: - Properties
    @StateObject var viewModel = PopularPersonsDetailsViewModel()
//    @State var name = ""
    
    // MARK: - Body
    var body: some View {
        Text("Hello world!")
//            .onAppear(perform: {
//                viewModel.fetchData(with: viewModel.person!.id)
//            })
    }
}

#Preview {
    PopularPersonsDetailsView()
}
