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
        VStack(spacing: 8) {
            listTitleView
            setupListView
        }
        .padding(.vertical, 5)
    }
    
    private var listTitleView: some View {
        Text("Popular Persons")
            .font(.title)
            .bold()
            .foregroundStyle(AppColor.textPrimary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
    }
    
    private var setupListView: some View {
        List() {
            ForEach(viewModel.persons, id: \.id) { person in
                navigateToDetailsView(for: person)
            }
            .listRowBackground(Color.clear)
        }
        .listStyle(PlainListStyle())
    }
    
    private func navigateToDetailsView(for person: Person) -> some View {
        Button(action: {
            showDetailsPage.toggle()
        }) {
            setupListRowView(for: person)
        }
        .sheet(isPresented: $showDetailsPage) {
            PopularPersonsDetailsView(personID: person.id)
                .presentationDetents([.fraction(0.99)])
        }
    }
    
    private func setupListRowView(for person: Person) -> some View {
        ListRowView(
            image: viewModel.generateImageURL(for: person.profilePath),
            title: person.name,
            shortInfo: "Known for:  \(person.knownForDepartment)",
            genre: person.genderString,
            imdb: "Popularity:",
            imdbRating: "\(person.popularity)"
        )
        .listRowSeparator(.hidden)
    }
}

#Preview {
    PopularPersonsView()
}
