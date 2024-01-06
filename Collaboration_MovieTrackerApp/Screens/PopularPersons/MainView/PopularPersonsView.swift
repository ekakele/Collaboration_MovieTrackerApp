//
//  PopularPersonsView.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 05.01.24.
//

import SwiftUI

struct PopularPersonsView: View {
    // MARK: - Properties
    @StateObject var viewModel = PopularPersonsViewModel()
    @State private var showDetailsPage: Bool = false
    
    // MARK: - Body
    var body: some View {
        ZStack {
            AppColor.background
                .ignoresSafeArea()
            listVStackView
        }
    }
    
    // MARK: - Components
    private var listVStackView: some View {
        VStack {
            setupListView
        }
        .padding(.vertical, 5)
    }
    
    private var detailsPageNavigatorView: some View {
        VStack {
            setupListView
        }
        .padding(.vertical, 5)
    }
    
    
    private var setupListView: some View {
        List() {
            ForEach(viewModel.persons, id: \.id) { person in
                Button(action: {
                    showDetailsPage.toggle()
                }, label: {
                    ListRowView(
                        image: viewModel.generateImageURL(for: person.profilePath)!,
                        title: person.name,
                        shortInfo: "Known for:  \(person.knownForDepartment)",
                        genre: person.genderString,
                        imdb: "Popularity:",
                        imdbRating: "\(person.popularity)"
                    )
                    .listRowSeparator(.hidden)
                })
                .sheet(isPresented: $showDetailsPage) {
                    PopularPersonsDetailsView()
                        .presentationDetents([.fraction(0.99)])
                }
            }
            .listRowBackground(Color.clear)
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    PopularPersonsView()
}
