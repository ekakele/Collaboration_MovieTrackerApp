//
//  PopularPersonsView.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 05.01.24.
//

import SwiftUI

struct PopularPersonsView: View {
    @StateObject var viewModel = PopularPersonsViewModel()
    
    var body: some View {
        ZStack {
            AppColor.background
                .ignoresSafeArea()
            
            setupListView
        }
    }
    
    private var setupListView: some View {
        List() {
            ForEach(viewModel.persons, id: \.id) { person in
                ListRowView(
                    image: viewModel.generateImageURL(for: person.profilePath)!,
                    title: person.name,
                    shortInfo: "Known for:  \(person.knownForDepartment)",
                    genre: person.genderString)
            }
            .listRowBackground(Color.clear)
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    PopularPersonsView()
}
