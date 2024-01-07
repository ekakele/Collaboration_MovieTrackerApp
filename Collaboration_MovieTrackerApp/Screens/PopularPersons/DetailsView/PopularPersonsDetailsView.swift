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
    @State var image = ""
    
    
    // MARK: - Body
    var body: some View {
        if let person = viewModel.person {
            setupDetailsView(for: person)
        } else {
            Text("Loading...")
                .onAppear {
                    viewModel.fetchData(with: personID)
                }
        }
    }
    
    private func setupDetailsView(for person: PersonDetailsModel) -> some View {
        DetailsView(
            image: viewModel.generateImageURL(for: person.profilePath),
            title: person.name,
            genre: person.knownForDepartment,
            imdb: "Birthday",
            imdbRating: person.birthday,
            shortInfo: person.biography,
            language: "",
            originCountry: person.placeOfBirth
        )
        .listRowSeparator(.hidden)
    }
}

#Preview {
    PopularPersonsDetailsView(personID: 1290466)
}
