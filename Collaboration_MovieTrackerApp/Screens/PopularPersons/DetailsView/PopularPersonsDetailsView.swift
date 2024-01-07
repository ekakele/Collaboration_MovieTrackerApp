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
    
    // MARK: - Components
    private func setupDetailsView(for person: PersonDetailsModel) -> some View {
        DetailsView(
            image: viewModel.generateImageURL(for: person.profilePath),
            title: person.name,
            genre: person.knownForDepartment,
            imdb: "",
            imdbRating: "",
            shortInfo: person.biography,
            language: person.birthday,
            originCountry: person.placeOfBirth,
            buttonTitle: "Add to Favorites",
            languageTitle: "Birthday"
        )
        .listRowSeparator(.hidden)
    }
}

#Preview {
    PopularPersonsDetailsView(personID: 1290466)
}
