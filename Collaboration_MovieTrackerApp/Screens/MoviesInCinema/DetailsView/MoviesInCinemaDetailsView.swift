//
//  MoviesInCinemaDetailsView.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 05.01.24.
//

import SwiftUI

struct MoviesInCinemaDetailsView: View {
    
    //MARK: - Properties
    @StateObject var viewModel = MoviesInCinemaDetailsViewModel()
    @State var movieID: Int
    
    var body: some View {
        ZStack {
            AppColor.background.ignoresSafeArea(.all)
            VStack(alignment: .leading) {
                MainTitleView(title: "Movie review")
                listView
                
            }
            .padding(.top, 12)
            .foregroundColor(AppColor.textPrimary)
        }
    }
    
    //MARK: - listView
    private var listView: some View {
        ScrollView {
            ForEach(viewModel.reviewResults, id: \.id) { result in
                ReviewRowView(
                    authorName: result.author,
                    review: result.content,
                    createdDate: result.createdAt,
                    authorRating: Int(result.authorDetails.rating ?? 0)
                )
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 16)
        .onAppear() {
            viewModel.fetchReviews(movieID: movieID)
        }
        .overlay {
            if viewModel.reviewResults.isEmpty {
                
                Text("There is no any review yet")
                    .font(Font.system(size: 16))
                    .foregroundColor(AppColor.textSecondary)
                    .frame(maxWidth: .infinity, minHeight: 120)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(style: StrokeStyle(lineWidth: 1, dash: [4]))
                            .foregroundColor(AppColor.textSecondary.opacity(0.4))
                    )
                    .padding()
            }
        }
    }
}
