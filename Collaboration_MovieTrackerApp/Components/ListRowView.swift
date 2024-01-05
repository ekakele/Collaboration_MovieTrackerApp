//
//  ListRowView.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 05.01.24.
//

import SwiftUI

struct ListRowView: View {
    //MARK: Properties
    var image: String
    var title: String
    var shortInfo: String
    var genre: String
    var imdb: String = ""
    var imdbRating: String = ""
    
    //MARK: Body
    var body: some View {
        HStack(spacing: 0) {
            itemImageView
            fullInfoStackView
        }
    }
    
    //MARK: Components
    private var fullInfoStackView: some View {
        VStack(alignment: .leading, spacing: 16) {
            contentInfoView
            additionalInfoView
        }
        .padding(.horizontal, 12)
        .foregroundColor(AppColor.textPrimary)
    }
    
    private var contentInfoView: some View {
        VStack(alignment: .leading, spacing: 4) {
            titleLabel
            shortInfoView
        }
    }
    
    private var itemImageView: some View {
        presentImage()
    }
    
    private func presentImage() -> some View {
        let imageURL = URL(string: image)
        
        return AsyncImage(
            url: imageURL,
            content: { fetchedImage in
                fetchedImage
                    .resizable()
                    .cornerRadius(6)
                    .frame(width: 110, height: 130)
                    .scaledToFit()
                
            }, placeholder: {
                Image("defaultImage")
                    .resizable()
                    .cornerRadius(6)
                    .frame(width: 110, height: 130)
                    .scaledToFit()
            })
    }
    
    private var titleLabel: some View {
        Text(title)
            .font(.title3)
            .bold()
    }
    
    private var shortInfoView: some View {
        Text(shortInfo)
            .foregroundColor(AppColor.textSecondary)
            .font(.subheadline)
            .lineLimit(3)
    }
    
    private var additionalInfoView: some View {
        HStack {
            genreInfoView
            Spacer()
            ratingInfo
        }
    }
    
    private var genreInfoView: some View {
        Text(genre)
            .foregroundColor(AppColor.textSecondary)
            .font(.subheadline)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .cornerRadius(4)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(AppColor.lightGray, lineWidth: 1)
            )
    }
    
    private var ratingInfo: some View {
        HStack(spacing: 8) {
            Text(imdb)
                .font(.subheadline)
                .foregroundColor(AppColor.textSecondary)
            Text(imdbRating)
                .font(.subheadline)
                .bold()
        }
    }
}

#Preview {
    ListRowView(image: "defaultImage", title: "Title", shortInfo: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", genre: "test", imdb: "IMDB", imdbRating: "4.8")
        .background(AppColor.background)
}
