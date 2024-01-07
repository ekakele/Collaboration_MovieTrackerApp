//
//  DetailsView.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Mariam Joglidze on 07.01.24.
//

import SwiftUI

struct DetailsView: View {
    //MARK: - Properties
    var image: String
    var title: String
    var genre: String
    var imdb: String
    var imdbRating: String
    var shortInfo: String
    var language: String
    var originCountry: String
    var buttonTitle: String
    var languageTitle: String = ""
    
    //MARK: - Body
    var body: some View {
        ZStack {
            AppColor.background
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                itemImageView
                fullInfoStackView
                    .padding()
                Spacer()
            }
        }
    }
    
    //MARK: - Components
    private var fullInfoStackView: some View {
        VStack(alignment: .leading, spacing: 16) {
            titleLabel
            additionalInfoView
            extraInfoView
            shortInfoView
            Spacer()
            ButtonView
        }
        .foregroundColor(AppColor.textPrimary)
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
                    .frame(maxWidth: .infinity)
                    .frame(height: 320)
                    .scaledToFit()
            }, placeholder: {
                Image("testImage")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 320)
                    .scaledToFit()
            })
    }
    
    private var ButtonView: some View {
        Button(action: {
            
        }) {
            Text(buttonTitle)
                .frame(maxWidth: .infinity)
                .padding()
                .background(AppColor.primaryGreen)
                .foregroundColor(AppColor.background)
                .cornerRadius(10)
        }
    }
    
    private var titleLabel: some View {
        Text(title)
            .font(.title3)
            .bold()
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
            Text(String(imdbRating))
                .font(.subheadline)
                .bold()
        }
    }
    
    private var extraInfoView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("\(languageTitle): \(language)")
                .font(.subheadline)
                .foregroundColor(AppColor.textSecondary)
            Text("Country: \(originCountry)")
                .font(.subheadline)
                .foregroundColor(AppColor.textSecondary)
        }
    }
    
    private var shortInfoView: some View {
        Text(shortInfo)
            .font(.subheadline)
            .foregroundStyle(AppColor.textPrimary)
    }
}
 

#Preview {
    DetailsView(image: "", title: "lorem is is si", genre: "action", imdb: "IMDB", imdbRating: "2.2", shortInfo: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", language: "English", originCountry: "USA", buttonTitle: "Watch")
}
