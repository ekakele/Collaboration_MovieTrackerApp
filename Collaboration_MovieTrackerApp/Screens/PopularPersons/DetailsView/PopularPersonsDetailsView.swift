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
    
    // MARK: - Body
    var body: some View {
        Text(biography)
            .onAppear(perform: {
                biography = "Hello"
            })
    }
    
//    var textView: some View {
//        if let person = viewModel.person {
//            Text(person.biography)
//        } else {
//            Text("Loading...")
//        }
//    }
    
}

#Preview {
    PopularPersonsDetailsView(personID: 1290466)
}
