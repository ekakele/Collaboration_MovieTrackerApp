//
//  ReviewRowView.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Nika Jamatashvili on 07.01.24.
//

import SwiftUI

struct ReviewRowView: View {
    //MARK: - Properties
    var authorName: String
    var review: String
    var createdDate: String
    var authorRating: Int
    
    //MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                titleLabelView
                contentView
            }
            additionalInfoView
        }
        .padding(16)
        .background(AppColor.darkGray)
        .cornerRadius(6)
    }
    
    //MARK: - Components
    private var titleLabelView: some View {
        Text(authorName)
            .foregroundColor(AppColor.textSecondary)
            .font(.title3)
            .bold()
    }
    
    private var contentView: some View {
        Text(review)
            .foregroundColor(AppColor.textPrimary)
            .font(Font.system(size: 16))
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
        HStack(spacing: 4) {
            Image(systemName: "star.fill")
                .foregroundColor(AppColor.primaryGreen.opacity(0.4))
            Text("\(authorRating)")
                .font(Font.system(size: 16))
                .bold()
                .foregroundColor(AppColor.textPrimary)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 6)
        .background(AppColor.lightGray.opacity(0.60))
        .font(.subheadline)
        .cornerRadius(4)
    }
    
    private var dateInfoView: some View {
        Text(createdDate)
            .font(.subheadline)
            .foregroundColor(AppColor.textSecondary)
    }
}
