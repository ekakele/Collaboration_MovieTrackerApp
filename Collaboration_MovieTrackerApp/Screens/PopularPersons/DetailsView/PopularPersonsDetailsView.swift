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
            Text(person.name)
            
            let image = viewModel.generateImageURL(for: viewModel.generateImageURL(for: person.profilePath))
                                                   
            let imageURL = URL(string: image)
            
            AsyncImage(
                url: imageURL,
                content: { fetchedImage in
                    fetchedImage
                        .resizable()
                        .cornerRadius(6)
                        .frame(width: 100, height: 140)
                        .scaledToFit()
                    
                }, placeholder: {
                    Image("defaultImage")
                        .resizable()
                        .cornerRadius(6)
                        .frame(width: 100, height: 140)
                        .scaledToFit()
                })

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
