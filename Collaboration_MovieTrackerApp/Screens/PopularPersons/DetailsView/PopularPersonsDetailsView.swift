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
    @State var personID: Int
    @State var biography = ""
    @State var name = ""
    
    // MARK: - Body
    var body: some View {
        if let person = viewModel.person {
            Text(person.name)

            Text(person.biography)
        } else {
            Text("Loading...")
                .onAppear {
                    viewModel.fetchData(with: personID)
                }
        }
    }
}

#Preview {
    PopularPersonsDetailsView(personID: 1290466)
}
