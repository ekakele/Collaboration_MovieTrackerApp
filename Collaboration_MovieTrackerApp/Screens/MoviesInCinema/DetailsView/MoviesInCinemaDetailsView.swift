//
//  MoviesInCinemaDetailsView.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 05.01.24.
//

import SwiftUI

struct MoviesInCinemaDetailsView: View {
    
    //MARK: Properties
    @StateObject var viewModel = MoviesInCinemaDetailsViewModel()
    @State var movieID: Int
    
    var body: some View {
        
        if let result = viewModel.reviewResults.first {
            Text(result.author)
            Text(result.content)
        } else {
            Text("Loading ... ")
                .onAppear {
                    viewModel.fetchReviews(movieID: movieID)
                }
        }
    }
    
    private var listView: some View {
        
        List() {
            ForEach(viewModel.reviewResults, id: \.id) { result in
                reviewRowView(
                    authorName: result.author,
                    review: result.content,
                    createdDate: result.createdAt,
                    authorRating: Int(result.authorDetails.rating ?? 0))
            }
        }
    }
}

//MARK: - reviewRowView
struct reviewRowView: View {
    
    let authorName: String
    let review: String
    let createdDate: String
    let authorRating: Int
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                titleLabelView
                contentView
            }
            additionalInfoView
        }
    }
    
    private var titleLabelView: some View {
        Text(authorName)
            .font(.title3)
            .bold()
            .lineLimit(1)
    }
    
    private var contentView: some View {
        Text(review)
            .foregroundColor(AppColor.textSecondary)
            .font(.subheadline)
            .lineLimit(6)
    }
    
    private var additionalInfoView: some View {
        HStack {
            dateInfoView
            Spacer()
            ratingInfoView
        }
    }
    
    private var ratingInfoView: some View {
        Text("\(authorRating)")
            .foregroundColor(AppColor.textPrimary)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(AppColor.lightGray.opacity(0.12))
            .font(.subheadline)
            .cornerRadius(4)
    }
    
    private var dateInfoView: some View {
        Text(createdDate)
            .font(.subheadline)
            .foregroundColor(AppColor.textSecondary)
    }
}
